*** Settings *** 
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that a Block is created successfully with valid parameters
    [Tags]     happy_path
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created
Verify that blocks is created without paramameters
    [Tags]     happy_path
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created
Verify blocks are not created with wrong values
    [Tags]     errors
    Create Block with "invalid status"
    Create Block with "invalid date"
    Create Block with "invalid date_gmt"
    Get Blocks List
    List Should Contain the 0 Blocks Created

*** Keywords ***
Setup Testcase
    Create Session And Authentication

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
