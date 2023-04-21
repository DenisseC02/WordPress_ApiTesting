*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/bodies/pages.py

*** Variables ***
${end_point_pages}    pages
${parent_id}    10

*** Test Cases ***
Verify child pages are listed filtering by parent id
    Create new page    ${body_test7_post1}  
    Create new page    ${body_test7_post2}
    Create new page    ${body_test7_post3}
    Retrieve the page by parent id

*** Keywords ***
Retrieve the page by parent id
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    parent=${parent_id}    
    Log    ${response}
    verify_same_parent    ${response}    ${parent_id}
