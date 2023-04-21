*** Settings *** 
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Setup testcase
Test Teardown    Teardown testcase
*** Variables ***

${end_point}    blocks
*** Test Cases ***
Verify that a publish block can be edited.
    Update Block    ${body_update}
    
*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Create Block    ${body_create}  
Teardown Testcase
    Delete Block
