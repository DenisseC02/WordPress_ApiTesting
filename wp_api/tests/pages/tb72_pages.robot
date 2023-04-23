*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Suite Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    ../../resources/data/bodies/pages.py
Resource    ../../keywords/pages/update.robot

*** Variables ***
${bad_status}    400

*** Test Cases ***
Verify that a page is not edited with wrong status value
    Create new page    ${body_test10_post}    ${ignore_list}    
    Update the page with wrong values    ${body_test10_put}    ${bad_status}

Verify that a page is not edited with wrong parent value
    Create new page    ${body_test11_post}    ${ignore_list}    
    Update the page with wrong values    ${body_test11_put}    ${bad_status}

Verify that a page is not edited with comment status value
    Create new page    ${body_test12_post}    ${ignore_list}    
    Update the page with wrong values    ${body_test12_put}    ${bad_status}

Verify that a page is not edited with featured media value
    Create new page    ${body_test13_post}    ${ignore_list}    
    Update the page with wrong values    ${body_test13_put}    ${bad_status}
