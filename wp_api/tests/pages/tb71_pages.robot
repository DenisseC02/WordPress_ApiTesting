*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/bodies/pages.py

*** Test Cases ***
Verify that a page can be created without parameters
    Create new page    ${body_test9_post}    
    Retrieve the page    200
