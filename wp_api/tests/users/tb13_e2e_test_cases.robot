*** Settings ***
Variables   wp_api/resources/data/bodies/users.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Create Session and params


*** Test Cases ***
Verify that is not possible to create more than one user with the same email
    [Tags]    errors
    ${id}   Create User And Get Key    ${create_user}       id
    ${user_with_same_email}    Create User With An Expected Error And Get Key   ${create_user}   code
    Verify Existing User Error   ${user_with_same_email}
    Delete User    ${id}

Verify that is not possible to create a user without a password
    [Tags]    errors
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_password}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is not possible to create a user without a username
    [Tags]    errors
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_username}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is not possible to create a user without an email
    [Tags]    errors
    ${post_response_user}    Create User With An Expected Error With Data    ${user_without_email}  code  400
    Verify Missing Parameter Error      ${post_response_user}

Verify that is possible to create a user and then update it
    [Tags]    smoke
    ${id}  Create User And Get Key    ${create_subscriber_user}   id
    Put User    ${update_user}    ${id}
    Delete User    ${id}

Verify that is not possible to edit the username
    [Tags]    errors
    ${id}  Create User And Get Key    ${create_user}   id
    ${put_response_user}  Put User Error With Data     ${update_username}    code   ${id}
    Verify Invalid Argument Error     ${put_response_user}
    Delete User    ${id}

Verify that is possible to create a user with subscriber role
    [Tags]    smoke
    ${post_response}   Create User    ${create_subscriber_user}
    Verify The Role    ${post_response}     role=subscriber
    Delete Created User    ${post_response}

Verify that possible to create a user with adminstrator role
    [Tags]    smoke
    ${post_response}   Create User with specific role    ${create_administrator_user}
    Verify The Role    ${post_response}     role=administrator
    Delete Created User    ${post_response}

Verify that possible to create a user with contributor role
    [Tags]    smoke
    ${post_response}   Create User with specific role    ${create_contributor_user}
    Verify The Role    ${post_response}     role=contributor
    Delete Created User    ${post_response}

Verify that possible to create a user with author role
    [Tags]    smoke
    ${post_response}   Create User with specific role    ${create_author_user}
    Verify The Role    ${post_response}     role=author
    Delete Created User    ${post_response}

Verify that possible to create a user with editor role
    [Tags]    smoke
    ${post_response}   Create User with specific role    ${create_editor_user}
    Verify The Role    ${post_response}     role=editor
    Delete Created User    ${post_response}

Verify that is not posible create a username with more than 60 characters
    [Tags]    errors
    ${value}   Create user with an expected error and get key    ${create_60_character_username}     code      500
    Verify Parameter To Long Error     ${value}
