*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
Force Tags    BLOCKS    BLOCKS_DELETE

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that a draft block can be deleted.
    [Tags]    BUGS
    Create 1 draft Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a publish block can be deleted
    Create 1 valid Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a furure block can be deleted
    Create 1 future Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a pending block can be deleted
    [Tags]    BUGS
    Create 1 pending Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a private block can be deleted
    [Tags]    BUGS
    Create 1 private Blocks
    Get Blocks List    
    Delete block ${id}
    List Should Contain the 0 Blocks Created

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
