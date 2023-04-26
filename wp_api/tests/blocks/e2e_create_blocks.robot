*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot
Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
Force Tags    BLOCKS    BLOCKS_CREATE

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that a Block is created successfully with valid parameters
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Private Block is created successfully
    Create 1 Private Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Draft Block is created successfully
    Create 1 Draft Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Pending Block is created successfully
    Create 1 Pending Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Future Block is created successfully
    Create 1 Future Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created
    
Verify that blocks is created without paramameters
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify blocks are not created with wrong status
    [Tags]     ERRORS
    Create Block with "invalid status"
    Get Blocks List
    List Should Contain the 0 Blocks Created

Verify blocks are not created with wrong date
    [Tags]     ERRORS
    Create Block with "invalid date"
    Get Blocks List
    List Should Contain the 0 Blocks Created

Verify blocks are not created with wrong date_gmt
    [Tags]     ERRORS
    Create Block with "invalid date_gmt"
    Get Blocks List
    List Should Contain the 0 Blocks Created

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
