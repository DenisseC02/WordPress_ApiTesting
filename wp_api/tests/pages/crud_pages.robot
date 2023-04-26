*** Settings ***
Library    ../../../venv/lib/site-packages/robot/libraries/Collections.py
Resource    ../../resources/imports.robot
Resource    ../../keywords/pages/crud.robot
Resource    ../../keywords/pages/keywords.robot
Variables    ../../resources/data/bodies/pages.py
Suite Setup    Create Session and params
Force Tags    SMOKE    PAGES    PAGES_CRUD

*** Variables ***
${end_point_pages}    pages

*** Test Cases ***
Verify is posible create, edit, list and delete a pages
    Create new page    ${body_test3_post}
    Update the page    ${body_test2_put}
    Retrieve the page    200
    Delete the page
