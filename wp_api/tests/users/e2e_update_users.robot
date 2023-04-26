*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test

*** Test Cases ***
Verify that is not possible to edit the username
    [Tags]    errors
    ${id}  Create User And Get Key    ${create_user}   id
    ${put_response_user}  Put User Error With Data     ${update_username}    code   ${id}
    Verify Invalid Argument Error     ${put_response_user}
    Delete User    ${id}
