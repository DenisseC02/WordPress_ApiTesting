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
${expected result}      existing_user_login

*** Test Cases ***
Verify that is not possible to create more than one user with the same email
    Create User    ${create_user}
    ${create_user2}    Create User With An Expected Error And Get Key   ${create_user}   code
    Test Response Value      ${expected result}    ${create_user2}

60, username, caracteres especiales en username, e email
