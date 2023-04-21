*** Settings *** 
Variables      wp_api/resources/data/json/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
*** Variables ***

${end_point}    blocks
*** Test Cases ***

Verify that a Block is created successfully with valid parameters
    Create Block    ${body_create}
    Read Block      200

*** Keywords ***
Setup Testcase
    Create Session And Authentication

Teardown Testcase
    Delete Block