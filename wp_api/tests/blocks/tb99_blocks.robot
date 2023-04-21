*** Settings *** 
Variables      wp_api/resources/data/json/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Create Session And Authentication
Test Teardown    Delete Session And Authentication
*** Variables ***

${end_point}    blocks
*** Test Cases ***


Verify that a draft block can be deleted.
    Create Block    ${body_create}    
    Delete Block    