*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/bodies/pages.py

*** Test Cases ***
Verify that a public page can be saved as a draft
    Create new page    ${body_test3_post}    
    Update the page    ${body_test3_put}
