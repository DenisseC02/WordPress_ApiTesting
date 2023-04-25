*** Settings ***
Resource    ../../resources/imports.robot
Variables    ../../resources/data/bodies/pages.py

*** Variables ***
${end_point_pages}    pages

*** Keywords ***
Update the page with wrong values
    [Arguments]    ${body}    ${status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}    ${status}
    verify_subset    ${code}    ${response}

Create parent page
    [Arguments]    ${body} 
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}   
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body}    ${expected_status}
    Log    ${response}
    verify_schema    ${path_create_schema}    ${response}
    Set Test Variable    ${response}

Create new page with password
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
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list_password}