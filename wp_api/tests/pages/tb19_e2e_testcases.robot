*** Settings ***
Library    ../../../venv/lib/site-packages/robot/libraries/Collections.py
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Suite Teardown    Delete Created Pages

*** Variables ***
${end_point_pages}    pages
${bad_status}    404
${wrong_values_status}    400

*** Test Cases ***
Verify that a draft page can be published
    [Tags]    smoke
    Create new page    ${body_test1_post}  
    Update the page    ${body_test1_put}

Verify that a public page can be edit
    [Tags]    smoke
    Create new page    ${body_test2_post}   
    Update the page    ${body_test2_put}

Verify that a public page can be saved as a draft
    [Tags]    smoke
    Create new page    ${body_test3_post}   
    Update the page    ${body_test3_put}

Verify that a page with closed comment status can be updated to an open comment status
    [Tags]    smoke
    Create new page    ${body_test5_post}
    Update the page    ${body_test5_put}

Verify that a page can be created without parameters
    [Tags]    smoke
    Create new page    ${body_test9_post}
    Retrieve the page    200

Verify that a page can be created without title
    [Tags]    smoke
    Create new page    ${body_test14_post}
    Retrieve the page    200

Verify that a new page can be created and update with a password
    [Tags]    smoke
    Create new page    ${body_test10_post}
    Update the page with password    ${body_test4_post}

Verify that a new page can be created and updated with a slug
    [Tags]    smoke
    Create new page    ${body_test10_post}
    Update the page    ${body_slug}

Verify that the password can be successfully removed from a page
    [Tags]    smoke
    Create new page with password    ${body_test4_post}
    Update the page    ${body_test4_put}
    Verify that the page does not have password

Verify that a page with closed comment status can be deleted
    [Tags]    smoke
    Create new page    ${body_test6_post}  
    Delete the page

Verify that a public page can be deleted
    [Tags]    smoke
    Create new page    ${body_test3_post}
    Delete the page

Verify that a draft page can be deleted
    [Tags]    smoke
    Create new page    ${body_test1_post}
    Delete the page

Verify that a page with password can be deleted
    [Tags]    smoke
    Create new page with password    ${body_test4_post} 
    Delete the page

Verify that cannot delete a page that does not exist
    [Tags]    errors
    Create new page    ${body_test2_post}
    Delete the page
    Attempt to delete the page again    ${bad_status}

Verify child pages are listed filtering by parent id
    [Tags]    smoke
    Create pages with the same parent id    ${body_parent1}    ${body_child11}    ${body_child12}
    Retrieve the page by parent id

Verify that a child page can be deleted without modifying pages with the same parent id
    [Tags]    smoke
    Create pages with the same parent id    ${body_parent2}    ${body_child21}    ${body_child22}
    Delete the page
    Verify that the other page are listed by parent id

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
Create pages with the same parent id
    [Arguments]    ${body_parent}    ${body_child_1}    ${body_child_2}
    Create parent page    ${body_parent}
    ${parent_id}    get_key_value    ${response}    id
    Set To Dictionary    ${body_child_1}    parent    ${parent_id}
    Set To Dictionary    ${body_child_2}    parent    ${parent_id}
    Create new page    ${body_child_1}
    Create new page    ${body_child_2}

Retrieve the page by parent id
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}
    ${parent_id}    get_key_value    ${response}    id
    ${response_get}    custom_get    ${session}    ${url}    parent=${parent_id}    
    Log    ${response}
    verify_same_parent    ${response_get}    ${parent_id}

Verify that the other page are listed by parent id
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}
    ${parent_id}    get_key_value    ${response}    id
    ${response}    custom_get    ${session}    ${url}    parent=${parent_id}    
    Log    ${response}
    verify_same_parent    ${response}    ${parent_id}

Attempt to delete the page again
    [Arguments]    ${status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    ${params}    ${status}
    verify_subset    ${delete_message}    ${response}

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
