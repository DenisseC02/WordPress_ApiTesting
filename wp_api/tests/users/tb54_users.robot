*** Settings ***
Variables   wp_api/resources/config/config.py
Variables   wp_api/resources/data/json/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/run.robot
Test Setup    Create Session and params

*** Variables ***
${expected result}      rest_user_invalid_argument

*** Test Cases ***
Verify that is not possible to create a user and then update the username
    ${id}  Create User And Get Key    ${create_user}   id
    ${put_response_user}  Put User Error With Data     ${update_username}    code   ${id}
    verify_equal_ignore    ${expected result}   ${put_response_user}
    ${del_response}    Delete User    ${id}
