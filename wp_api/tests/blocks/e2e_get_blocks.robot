*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot
Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
Force Tags    BLOCKS    BLOCKS_GET

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify list of available blocks
    Create 3 Valid Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created

Verify draft blocks are not listed by default
    Create 3 Valid Blocks
    Create 2 Draft Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created

Verify Private blocks are not listed by default
    [Tags]    ERRORS
    Create 4 Valid Blocks
    Create 1 Private Blocks
    Get list of block ids
    List Should Contain the 4 Blocks Created

Verify Pending blocks are not listed by default
    [Tags]    ERRORS
    Create 2 Valid Blocks
    Create 1 Pending Blocks
    Get list of block ids
    List Should Contain the 2 Blocks Created

Verify Future blocks are listed by default
    Create 1 Valid Blocks
    Create 5 Future Blocks
    Get list of block ids
    List Should Contain the 6 Blocks Created

Verify that the list of blocks is returned filtered by ids.
    Create Block    ${body_create}
    Read all Blocks    ${extraurl}

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
