*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test
Force Tags    USERS  USERS_CREATE

*** Test Cases ***
Verify that is not possible to create more than one user with the same email
    [Tags]    ERRORS
    ${id}   Create User And Get Key    ${create_user}       id
    ${user_with_same_email}    Create User With An Expected Error And Get Key   ${create_user}   code
    Verify Existing User Error   ${user_with_same_email}
    Delete User    ${id}

Verify that is not possible to create a user without a password
    [Tags]    ERRORS
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_password}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is not possible to create a user without a username
    [Tags]    ERRORS
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_username}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is not possible to create a user without an email
    [Tags]    ERRORS
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_email}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is possible to create a user and then update it
    ${id}  Create User And Get Key    ${create_subscriber_user}   id
    Put User    ${update_user}    ${id}
    Delete User    ${id}

Verify that is possible to create a user with subscriber role
    ${post_response}   Create User    ${create_subscriber_user}
    Verify The Role    ${post_response}     role=subscriber
    Delete User    ${id}

Verify that possible to create a user with adminstrator role
    ${post_response}   Create User with specific role    ${create_administrator_user}   administrator
    Verify The Role    ${post_response}     role=administrator
    Delete User    ${id}

Verify that possible to create a user with contributor role
    ${post_response}   Create User with specific role    ${create_contributor_user}   contributor
    Verify The Role    ${post_response}     role=contributor
    Delete User    ${id}

Verify that possible to create a user with author role
    ${post_response}   Create User with specific role    ${create_author_user}    author
    Verify The Role    ${post_response}     role=author
    Delete User    ${id}

Verify that possible to create a user with editor role
    ${post_response}   Create User with specific role    ${create_editor_user}   editor
    Verify The Role    ${post_response}     role=editor
    Delete User    ${id}

Verify that is not posible create a username with more than 60 characters
    ${value}   Create user with an expected error and get key    ${create_60_character_username}     code      500
    Verify Parameter To Long Error     ${value}
