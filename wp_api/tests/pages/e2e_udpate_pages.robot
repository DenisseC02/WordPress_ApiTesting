*** Settings ***
Library    ../../../venv/lib/site-packages/robot/libraries/Collections.py
Resource    ../../resources/imports.robot
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Suite Teardown    Delete Created Pages
Force Tags    PAGES    PAGES_UPDATE

*** Variables ***
${end_point_pages}    pages
${wrong_values_status}    400

*** Test Cases ***
Verify that a draft page can be published
    Create new page    ${body_test1_post}  
    Update the page    ${body_test1_put}

Verify that a public page can be edit
    Create new page    ${body_test2_post}   
    Update the page    ${body_test2_put}

Verify that a public page can be saved as a draft
    Create new page    ${body_test3_post}   
    Update the page    ${body_test3_put}

Verify that a new page can be created and update with a password
    Create new page    ${body_test10_post}
    Update the page with password    ${body_test4_post}

Verify that a new page can be created and updated with a slug
    Create new page    ${body_test10_post}
    Update the page    ${body_slug}

Verify that a page with closed comment status can be updated to an open comment status
    Create new page    ${body_test5_post}
    Update the page    ${body_test5_put}

Verify that the password can be successfully removed from a page
    Create new page with password    ${body_test4_post}
    Update the page    ${body_test4_put}
    Verify that the page does not have password 

Verify that a page is not edited with wrong status value
    [Tags]    errors
    Create new page    ${body_test10_post}   
    Update the page with wrong values    ${body_test10_put}    ${wrong_values_status}

Verify that a page is not edited with wrong parent value
    [Tags]    errors
    Create new page    ${body_test11_post}   
    Update the page with wrong values    ${body_test11_put}    ${wrong_values_status}

Verify that a page is not edited with comment status value
    [Tags]    errors
    Create new page    ${body_test12_post}
    Update the page with wrong values    ${body_test12_put}    ${wrong_values_status}

Verify that a page is not edited with featured media value
    [Tags]    errors
    Create new page    ${body_test13_post}
    Update the page with wrong values    ${body_test13_put}    ${wrong_values_status}

*** Keywords ***
Update the page with password
    [Arguments]    ${body}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}
    verify_schema    ${path_update_schema}    ${response}
    ${response_get}    custom_get    ${session}    ${url}    ${params}    
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list_password}

Verify that the page does not have password
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    ${params}
    verify_subset    ${remove_pass}    ${response}
