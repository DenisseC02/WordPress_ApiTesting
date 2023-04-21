*** Settings ***
Variables   wp_api/resources/config/config.py
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/users_keywords.robot

*** Variables ***
${end_point_path}       users


*** Test Cases ***
Verify that is not possible to create more than one user with the same email
    ${session}   ${params}    Create Session
    ${create_user_response}   Create User And Get Key    ${create_subscriber_user}  id
    ${create_user2}    Create User And Get Key    ${create_subscriber_user}   code   500
    Log                       Expected_result: existing_user_login
    Log                       Actual result: ${create_user2}
    Should Be Equal           existing_user_login   ${create_user2}
    Delete User    ${create_user_response}
