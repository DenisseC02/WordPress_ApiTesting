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
Verify that a page is not edited with wrong parent value
    Create new page    ${body_test11_post}    
    Update the page with wrong values    ${body_test11_put}    ${bad_status}
