*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Suite Setup    Create Session and params
Variables    ../../resources/data/bodies/pages.py
Resource    ../../keywords/pages/update.robot

*** Variables ***
${bad_status}    410

*** Test Cases ***
Verify that a page with closed comment status can be deleted
    Create new page    ${body_test6_post}    ${ignore_list}  
    Delete the page

Verify that a public page can be deleted
    Create new page    ${body_test3_post}    ${ignore_list}
    Delete the page

Verify that a draft page can be deleted
    Create new page    ${body_test1_post}    ${ignore_list} 
    Delete the page

Verify that a page with password can be deleted
    Create new page    ${body_test4_post}    ${ignore_list_password}  
    Delete the page

Verify that cannot delete a page that does not exist
    Create new page    ${body_test2_post}    ${ignore_list}    
    Delete the page
    Attempt to delete the page again    ${bad_status}
