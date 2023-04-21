*** Settings ***
Variables   wp_api/resources/config/config.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler

*** Variables ***
${end_point_path}       users
${expected result}      rest_missing_callback_param

*** Test Cases ***
Verify that is not possible to create a user without a password
    ${url}                    Get Url      endpoint=${end_point_path}
    ${session}   ${params}    Create Session
    ${body}      Create Dictionary   username=martinjonatan19  email=martinjonatan2'@gmail.com  role=subscriber  first_name=Martin  last_name=Alvarez10
    ${post_response_user}    Custom Post    ${session}    ${url}     ${params}   ${body}   400   key  code
    Log                       Expected_result:${expected result}
    Log                       Actual result: ${post_response_user}
    Should Be Equal           rest_missing_callback_param  ${post_response_user}

Verify that is not possible to create a user without a username
    ${url}                    Get Url      endpoint=${end_point_path}
    ${session}   ${params}    Create Session
    ${body}      Create Dictionary   password=1245  email=martinjonatan19@gmail.com  role=subscriber  first_name=Martin  last_name=Alvarez10
    ${post_response_user}    Custom Post    ${session}    ${url}     ${params}   ${body}   400   key  code
    Log                       Expected_result:${expected result}
    Log                       Actual result: ${post_response_user}
    Should Be Equal           rest_missing_callback_param  ${post_response_user}

Verify that is not possible to create a user without an email
    ${url}                    Get Url      endpoint=${end_point_path}
    ${session}   ${params}    Create Session
    ${body}      Create Dictionary   password=1245    username=martinjonatan19   role=subscriber  first_name=Martin  last_name=Alvarez10
    ${post_response_user}    Custom Post    ${session}    ${url}     ${params}   ${body}   400   key  code
    Log                       Expected_result:${expected result}
    Log                       Actual result: ${post_response_user}
    Should Be Equal           rest_missing_callback_param  ${post_response_user}