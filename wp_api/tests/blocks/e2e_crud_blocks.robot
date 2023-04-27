*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot
Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
Force Tags    SMOKE    BLOCKS    BLOCKS_CRUD

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify is posible create list edit and delete a block
    Create 1 Valid Blocks
    Update The Date Of The Block
    Get Block
    Delete Block
    List Should Contain the 0 Blocks Created

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
