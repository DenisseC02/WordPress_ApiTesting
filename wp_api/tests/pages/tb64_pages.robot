*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Suite Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/bodies/pages.py

*** Test Cases ***
Verify that a draft page can be published
    Create new page    ${body_test1_post}    ${ignore_list}    
    Update the page    ${body_test1_put}    ${ignore_list}

Verify that a public page can be edit
    Create new page    ${body_test2_post}    ${ignore_list}    
    Update the page    ${body_test2_put}    ${ignore_list}

Verify that a public page can be saved as a draft
    Create new page    ${body_test3_post}    ${ignore_list}    
    Update the page    ${body_test3_put}    ${ignore_list}

Verify that a page with closed comment status can be updated to an open status
    Create new page    ${body_test5_post}    ${ignore_list} 
    Update the page    ${body_test5_put}    ${ignore_list}

Verify that a page can be created without parameters
    Create new page    ${body_test9_post}    ${ignore_list}
    Retrieve the page    200

Verify that a new page can be created and update with a password
    Create new page    ${body_test10_post}    ${ignore_list}
    Update the page    ${body_test4_post}    ${ignore_list_password}

Verify that a new page can be created and updated with a slug
   Create new page    ${body_test10_post}    ${ignore_list}
   Update the page    ${body_slug}    ${ignore_list} 
