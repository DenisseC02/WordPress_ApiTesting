*** Settings ***
Resource    ../../resources/imports.robot
Variables    ../../resources/data/bodies/pages.py
*** Variables ***
${expected_status}    201
${end_point_pages}    pages

*** Keywords ***
Create new page
    [Arguments]    ${body} 
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}   
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body}    ${expected_status}
    Log    ${response}
    verify_schema    ${path_create_schema}    ${response}
    ${id}    get_key_value    ${response}    id
    Set Global Variable    ${id}
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
    ${response}    custom_delete    ${session}    ${url}    ${params}
    Log    ${response}
    verify_schema    ${path_delete_schema}    ${response}
    ${response_delete}    custom_get    ${session}    ${url}    ${params}
    Log    ${response_delete}
    verify_subset    ${page_status}    ${response_delete}    
