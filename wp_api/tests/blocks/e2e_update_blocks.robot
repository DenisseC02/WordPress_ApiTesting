*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot
Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
Force Tags    BLOCKS    BLOCKS_UPDATE

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that the status of the block can be edited.
    Create 1 Valid Blocks
    Update The Status Of The Block
    Get Blocks List
    Verify That The status Is Updated

Verify that the slug of the block can be edited.
    Create 1 Valid Blocks
    Update The slug Of The Block
    Get Blocks List
    Verify That The slug Is Updated

Verify that the date of the block can be edited.
    Create 1 Valid Blocks
    Update The date Of The Block
    Get Blocks List
    Verify That The date Is Updated

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
