*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/json/pages.py

*** Test Cases ***
Verify that a page can be created without parameters
    Create new page    ${body_test5_post}    
    Update the page    ${body_test5_put}
