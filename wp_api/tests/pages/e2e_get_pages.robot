*** Settings ***
Library    Collections
Resource    ../../resources/imports.robot
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Suite Teardown    Delete Created Pages
Force Tags    PAGES    PAGES_GET

*** Variables ***
${end_point_pages}    pages

*** Test Cases ***
Verify child pages are listed filtering by parent id
    Create pages with the same parent id    ${body_parent1}    ${body_child11}    ${body_child12}
    Retrieve the page by parent id

Verify that a child page can be deleted without modifying pages with the same parent id
    Create pages with the same parent id    ${body_parent2}    ${body_child21}    ${body_child22}
    Delete the page
    Verify that the other page are listed by parent id

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
