*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/json/pages.py
Resource    ../../keywords/pages/update.robot

*** Variables ***
${bad_status}    400

*** Test Cases ***
Verify that a page is not edited with comment status value
    Create new page    ${body_test12_post}    
    Update the page with wrong values    ${body_test12_put}    ${bad_status}
