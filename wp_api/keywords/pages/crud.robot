*** Settings ***
Resource    ../../resources/imports.robot
Variables    ../../resources/data/bodies/pages.py
*** Variables ***
${expected_status}    201
${end_point_pages}    pages
${force}    True

*** Keywords ***
Create Session and params
    ${session}  ${params}  create_session
    Set Suite Variable    ${session}
    Set Suite Variable    ${params}

Create new page
    [Arguments]    ${body}
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}   
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body}    ${expected_status}
    verify_schema    ${path_create_schema}    ${response}
    ${id}    get_key_value    ${response}    id
    Set Test Variable    ${id}
    ${url_get}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response_get}    custom_get    ${session}    ${url_get}    ${params}    
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Retrieve the page
    [Arguments]    ${new_status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    ${params}    ${new_status}
    Log    ${response}
    verify_schema    ${path_list_schema}    ${response}

Update the page
    [Arguments]    ${body}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}
    verify_schema    ${path_update_schema}    ${response}
    ${response_get}    custom_get    ${session}    ${url}    ${params}    
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Delete the page
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    force=${force}
    verify_schema    ${path_delete_schema}    ${response}
    verify_subset    ${delete}    ${response}

Get pages list
    ${url}    get_url    path=${end_point_pages}    per_page=?per_page=100&status=publish,draft
    ${ids}    custom_get    ${session}    ${url}    ${params}    response_type=key    extra_param=id
    Set Suite Variable    ${ids}

Delete Created Pages
    Get pages list
    FOR    ${id}    IN    @{ids}
        Delete page    ${id}
    END

Delete page
    [Arguments]    ${id}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    force=${force}
    ${response_get}    custom_get    ${session}    ${url}    ${params}    404
    verify_subset ignore    ${response_get}    ${delete_message}
