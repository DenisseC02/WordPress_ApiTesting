*** Settings *** 
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that a draft block can be deleted.
    Create 1 draft Blocks
    Get Blocks List    
    Delete block ${id}
VErify that a publish block can be deleted
    Create 1 valid Blocks
    Get Blocks List    
    Delete block ${id}

*** Keywords ***
Setup Testcase
    Create Session And Authentication    
Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
