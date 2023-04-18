*** Settings ***
Variables   wp_api/resources/config/config.py
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler

*** Variables ***
${end_point_path}       users


*** Test Cases ***
Verify that is not possible to create more than one user with the same email
    ${url}                    Get Url      endpoint=${end_point_path}
    ${session}   ${params}    Create Session
    ${body}      Create Dictionary  password=12345  username=martinjonatan18  email=martinjonatan18@gmail.com  role=subscriber  first_name=Martin  last_name=Alvarez10
    ${post_response_user1}    Custom Post    ${session}    ${url}     ${params}   ${body}   201    key   id
    ${url_id}                 Get Url     endpoint=${end_point_path}     id=${post_response_user1}
    ${get_response_user1}     Custom Get     ${session}    ${url_id}     ${params}   200
    ${post_response_user2}    Custom Post    ${session}    ${url}     ${params}   ${body}   500  key  code
    Log                       Expected_result: existing_user_login
    Log                       Actual result: ${post_response_user2}
    Should Be Equal           existing_user_login   ${post_response_user2}
    ${params_delete}    Create Dictionary    force=true     reassign=1
    ${del_response_user1}   Custom Delete     ${session}    ${url_id}     ${params_delete}   200