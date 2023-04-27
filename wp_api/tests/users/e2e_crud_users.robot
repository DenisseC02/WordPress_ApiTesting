*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test
Force Tags   SMOKE  USERS  USERS_CRUD

*** Test Cases ***
Verify that is possible to create a user with subscriber role
    Create User    ${create_subscriber_user}
    Put User    ${update_user}   ${id}
    Get User    ${id}
    Delete User    ${id}
