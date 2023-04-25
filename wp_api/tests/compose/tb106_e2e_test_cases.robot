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

*** Test Cases ***
Verify that is possible to create a user and...
    [Tags]    smoke
    ${user}   ${password}   Create User And Return Credentials    ${create_administrator_user}
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#    Put User    ${update_user}    ${id}
#    Delete User    ${id}