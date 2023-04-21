*** Settings *** 
Variables      wp_api/resources/data/json/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase
*** Variables ***

${end_point}    blocks
*** Test Cases ***


Verify that a draft block can be deleted.
    Delete Block    

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Create Block    ${body_create}    
Teardown Testcase
    Delete Session And Authentication