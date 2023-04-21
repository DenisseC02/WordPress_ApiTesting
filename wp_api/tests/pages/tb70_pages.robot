*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Variables    ../../resources/data/bodies/pages.py

*** Variables ***
${end_point_pages}    pages
${parent_id}    2

*** Test Cases ***
Verify that a child page can be deleted without modifying pages with the same parent id
    Create new page    ${body_test8_post1}
    Create new page    ${body_test8_post2}
    Create new page    ${body_test8_post3}
    Delete the page
    Verify that the other page are listed by parent id

*** Keywords ***
Verify that the other page are listed by parent id
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    parent=${parent_id}    
    Log    ${response}
    verify_same_parent    ${response}    ${parent_id}
