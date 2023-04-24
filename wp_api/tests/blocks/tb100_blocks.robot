*** Settings *** 
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Create Session And Authentication
Test Teardown    Delete Block
*** Variables ***

${end_point}    blocks
*** Test Cases ***
Verify that the list of blocks is returned filtered by ids.
    Create Block    ${body_create}    
    Read all Blocks    ${extraurl}
