*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    ../../keywords/users/keywords.robot
Resource    ../../keywords/pages/run.robot
Test Setup    Create Session and params


*** Test Cases ***
Verify that is possible to create a user and then update it
    ${id}  Create User And Get Key    ${create_user}   id
    ${put_response_user}  Put User    ${update_user}    ${id}
    ${del_response}    Delete User    ${id}