*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Variables   wp_api/resources/data/bodies/blocks.py
Resource    wp_api/keywords/blocks/crud_blocks.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Create Session and params
Force Tags    compose
Test Teardown    Teardown Testcase

*** Test Cases ***
Verify that a Block is created with valid parameters with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with role and return credentials    administrator
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

*** Keywords ***
Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
