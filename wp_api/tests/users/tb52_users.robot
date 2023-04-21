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
${end_point_path}       users
${expected result}      rest_missing_callback_param

*** Test Cases ***
Verify that is not possible to create a user without a password
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_password}  code  400
    Test Response Value      rest_missing_callback_param   ${post_response_user}

Verify that is not possible to create a user without a username
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_username}  code  400
    Test Response Value      rest_missing_callback_param   ${post_response_user}

Verify that is not possible to create a user without an email
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_email}  code  400
    Test Response Value      rest_missing_callback_param   ${post_response_user}