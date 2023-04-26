*** Settings ***
Library    Collections
Resource    ../../resources/imports.robot
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Force Tags    PAGES    PAGES_DELETE

*** Variables ***
${end_point_pages}    pages
${bad_status}    404

*** Test Cases ***
Verify that a page with closed comment status can be deleted
    Create new page    ${body_test6_post}  
    Delete the page

Verify that a page with open comment status can be deleted
    Create new page    ${body_test3_post}  
    Delete the page

Verify that a public page can be deleted
    Create new page    ${body_test3_post}
    Delete the page

Verify that a draft page can be deleted
    Create new page    ${body_test1_post}
    Delete the page

Verify that a page with password can be deleted
    Create new page with password    ${body_test4_post} 
    Delete the page
    
Verify that a page with slug can be deleted
    Create new page    ${body_slug}
    Delete the page

Verify that cannot delete a page that does not exist
    Create new page    ${body_test2_post}
    Delete the page
    Attempt to delete the page again    ${bad_status}

*** Keywords ***
Attempt to delete the page again
    [Arguments]    ${status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    ${params}    ${status}
    verify_subset    ${delete_message}    ${response}
