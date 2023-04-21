*** Settings ***
Variables   wp_api/resources/config/config.py
Variables   wp_api/resources/data/json/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/run.robot
Test Setup    Create Session and params


*** Test Cases ***
Verify that is not possible to create a user and then update the username
    ${id}  Create User And Get Key    ${create_user}   id
    ${put_response_user}  Put User And Get Key    ${user_admin_color}   ${id}   admin_color
    Log    ${put_response_user}

