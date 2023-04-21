*** Settings ***
Variables   wp_api/resources/config/config.py
Variables   wp_api/resources/data/json/users.py
Library     libraries.process_data.process_data.ProcessData
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Library     libraries.assertions.verification.Verification
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/run.robot
Test Setup    Create Session and params

*** Variables ***
${end_point_path}       users
${create_json}      wp_api/resources/data/schemas/users/create_user.json

*** Test Cases ***
Verify create
    ${create_user_response}   Create User   ${create_subscriber_user}
    ${id}    get_key_value    ${create_user_response}    id
    ${get_response}     Get User    ${id}
    ${put_response}     Put User   ${update_user}  ${id}
    ${del_response}     Delete User    ${id}





