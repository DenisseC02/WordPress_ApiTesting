*** Settings ***
Variables   wp_api/resources/config/config.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler

*** Variables ***
${end_point_path}       users


*** Keywords ***
Get users endpoint
    ${user_url}     get_url      endpoint=${end_point_path}
    [Return]    ${user_url}

Create user
    [Arguments]    ${body}   ${status_code}=201
    ${url}                   Get Users Endpoint
    ${session}   ${params}   create_session
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}

Create user and get response
    [Arguments]    ${body}   ${status_code}=201
    ${url}                   Get Users Endpoint
    ${session}   ${params}   create_session
    ${post_response_user}    custom_post    ${session}    ${url}     ${params}   ${body}     ${status_code}
    [Return]   ${post_response_user}

Create user and get key
    [Arguments]    ${body}   ${key}  ${status_code}=201
    ${url}                   Get Users Endpoint
    ${session}   ${params}   create_session
    ${user_key}    custom_post    ${session}  ${url}  ${params}  ${body}  ${status_code}   key  ${key}
    [Return]   ${user_key}

Get user
    [Arguments]    ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    ${session}   ${params}  create_session
    ${user_key}    custom_get    ${session}  ${url}/${id}  ${params}  ${status_code}

Put user
    [Arguments]    ${body}     ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    ${session}    ${params}  create_session
    ${user_key}    custom_put    ${session}  ${url}/${id}  ${params}   ${body}   ${status_code}

Delete user
    [Arguments]    ${id}    ${status_code}=200
    ${url}                  Get Users Endpoint
    ${session}   ${params}  create_session
    ${params_del}  Create Dictionary    force=true     reassign=1
    ${user_key}    custom_delete    ${session}  ${url}/${id}  ${params_del}  ${status_code}

