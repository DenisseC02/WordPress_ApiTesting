*** Settings ***
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Library     libraries.assertions.verification.Verification
Library     libraries.process_data.process_data.ProcessData
Variables    ../../resources/data/bodies/users.py

*** Variables ***
${end_point_path}       users

*** Keywords ***
Get users endpoint
    ${user_url}     get_url      endpoint=${end_point_path}
    [Return]    ${user_url}

Create user
    [Arguments]    ${body}   ${status_code}=201
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
    verify_schema    ${create_subscriber_user_schema}    ${post_response_user}
    [Return]    ${post_response_user}

Create user and return credentials
    [Arguments]    ${body}   ${status_code}=201
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
#    verify_schema    ${create_subscriber_user_schema}    ${post_response_user}
    [Return]    ${body['username']}     ${body['password']}

Create user with specific role
    [Arguments]    ${body}   ${status_code}=201
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
    [Return]    ${post_response_user}

Create user and get key
    [Arguments]    ${body}   ${key}  ${status_code}=201
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
    verify_schema    ${create_subscriber_user_schema}    ${post_response_user}
    ${value}    get_key_value    ${post_response_user}    ${key}
    [Return]   ${value}

Create user with an expected error and get key
    [Arguments]    ${body}   ${key}  ${status_code}=500
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
    ${value}    get_key_value    ${post_response_user}    ${key}
    [Return]   ${value}

Create user with an expected error with data
    [Arguments]    ${body}   ${key}  ${status_code}=500
    ${url}                   Get Users Endpoint
    Log    ${url}
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    Log    ${post_response_user}
    verify_schema    ${path_error_data_schema}    ${post_response_user}
    ${value}    get_key_value    ${post_response_user}    ${key}
    [Return]   ${value}

Get user
    [Arguments]    ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    Log    ${url}
    ${get_response_user}    custom_get    ${session}  ${url}/${id}  ${params}  ${status_code}
    Log    ${get_response_user}
    verify_schema    ${path_get_schema}    ${get_response_user}
    [Return]    ${get_response_user}

Put user
    [Arguments]    ${body}     ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    Log    ${url}
    ${put_response_user}    custom_put    ${session}  ${url}/${id}  ${params}   ${body}   ${status_code}
    Log    ${put_response_user}
    [Return]    ${put_response_user}

Put user and get key
    [Arguments]    ${body}    ${id}   ${key}   ${status_code}=200
    ${url}                  Get Users Endpoint
    Log    ${url}
    ${put_response_user}    custom_put    ${session}  ${url}/${id}  ${params}   ${body}   ${status_code}
    Log    ${put_response_user}
    verify_schema    ${path_update_schema}    ${put_response_user}
    ${value}    get_key_value    ${put_response_user}    ${key}
    [Return]   ${value}

Put user error with data
    [Arguments]    ${body}   ${key}   ${id}    ${status_code}=400
    ${url}                  Get Users Endpoint
    Log    ${url}
    ${put_response_user}    custom_put    ${session}  ${url}/${id}  ${params}   ${body}   ${status_code}
    Log    ${put_response_user}
    ${value}    get_key_value    ${put_response_user}    ${key}
    [Return]   ${value}

Delete user
    [Arguments]    ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    Log     ${url}
    ${params_del}  Create Dictionary    force=true     reassign=1
    Log     ${params_del}
    ${del_response_user}    custom_delete    ${session}  ${url}/${id}  ${params_del}  ${status_code}
    verify_schema    ${path_delete_schema}    ${del_response_user}
    [Return]    ${del_response_user}

Delete created user
    [Arguments]    ${response}    ${status_code}=200
    ${url}                  Get Users Endpoint
    Log     ${url}
    ${params_del}   Create Dictionary    force=true     reassign=1
    Log     ${params_del}
    ${id}    get_key_value    ${response}    id
    ${del_response}    custom_delete    ${session}  ${url}/${id}  ${params_del}  ${status_code}
    [Return]    ${del_response}


Verify existing user error
    [Arguments]    ${response}
    verify_equal_ignore      existing_user_login    ${response}


Verify missing parameter error
    [Arguments]    ${response}
    verify_equal_ignore     rest_missing_callback_param   ${response}

Verify invalid argument error
    [Arguments]    ${response}
    verify_equal_ignore    rest_user_invalid_argument   ${response}

Verify the role
    [Arguments]    ${response}      ${role}
    @{roles}      Create List    ${role}
    verify_equal_ignore    ${roles}   ${response['roles']}

Verify parameter to long error
    [Arguments]    ${response}
    verify_equal_ignore    user_login_too_long  ${response}
