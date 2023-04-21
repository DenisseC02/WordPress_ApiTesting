*** Settings *** 
Variables      wp_api/resources/data/json/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Create Session And Authentication
Test Teardown    Delete Block
*** Variables ***

${end_point}    blocks
*** Test Cases ***

Verify that a Block is created successfully with valid parameters
    Create Block    ${body_create}
    Read Block    200
