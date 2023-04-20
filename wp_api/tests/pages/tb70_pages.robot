*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Variables    ../../resources/data/json/pages.py

*** Variables ***
${end_point_pages}    pages
${parent_id}    13

*** Test Cases ***
Verify that a child page can be deleted without modifying pages with the same parent id
    Create new page    ${body_test8_post1}
    Create new page    ${body_test8_post2}
    Create new page    ${body_test8_post3}
    Delete the page
    Verify that the other page are listed by parent id
#este borrara el ultimo nomas pero luego nose como listar por parent id, y terminar de borrar los otros dos pages
*** Keywords ***
Verify that the other page are listed by parent id
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    parent=${parent_id}    
    Log    ${response}
    verify_same_parent    ${response}    ${parent_id}
