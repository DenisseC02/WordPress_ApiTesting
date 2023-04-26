*** Settings ***
Library    Collections
Resource    ../../resources/imports.robot
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Suite Teardown    Delete Created Pages
Force Tags    PAGES    PAGES_CREATE

*** Variables ***
${end_point_pages}    pages

*** Test Cases ***
Verify that a Page is created successfully with valid parameters
    Create new page    ${body_test3_post}
    Retrieve the page    200

Verify that a page can be created without parameters
    Create new page    ${body_test9_post}
    Retrieve the page    200

Verify that a page can be created without title
    Create new page    ${body_test14_post}
    Retrieve the page    200

Verify that a Draft Page is created successfully
    Create new page    ${body_test1_post}
    Retrieve the page    200
