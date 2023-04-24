*** Settings *** 
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Library        libraries.utils.block_body_generator.BodyGenerator
Test Setup       Setup testcase
Test Teardown    Teardown testcase
*** Variables ***

${end_point}    blocks
*** Test Cases ***
    
Verify list of available blocks
    #the api should return a list of blocks.
    Create 3 Valid Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created

Verify draft blocks are not listed by default
    Create 3 Valid Blocks
    Create 2 Draft Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created
Verify that created block can be updated
    Create 1 Valid Blocks
    Get list of block ids

*** Keywords ***
Setup Testcase
    Create Session And Authentication

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
