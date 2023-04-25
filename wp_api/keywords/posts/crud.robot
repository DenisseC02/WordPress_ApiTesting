*** Settings ***
Library    libraries.requests.custom_request.CustomRequest
Library    libraries.authentication.custom_session.CustomSession
Library    libraries.process_data.process_data.ProcessData
Library    libraries.assertions.verification.Verification
Library    libraries.process_data.url_assembler.UrlAssembler
Variables     wp_api/resources/data/bodies/posts.py

*** Variables ***
${expected_status}      201
${end_point_posts}      posts
${data_delete}          true
${post_status}

*** Keywords ***
Create new post
    [Arguments]    ${body}
    ${url}   get_url    posts=${end_point_posts}
    Log     ${url}
    ${response}  custom_post   ${session}   ${url}     ${params}     ${body}     ${expected_status}
    Log     ${response}
    ${id}    get_key_value    ${response}   id
    verify_schema    ${path_create_schema}    ${response}
    Set Global Variable    ${id}
    ${url_get}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url_get}
    ${response_get}    custom_get    ${session}    ${url_get}    ${params}
    Log      ${response_get}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Retrieve the post
    [Arguments]     ${new_status}
    ${url}      get_url      end_point=${end_point_posts}      id=${id}
    Log     ${url}
    ${response}     custom_get     ${session}      ${url}      ${params}      ${new_status}
    Log      ${response}
    verify_schema      ${path_list_schema}     ${response}

Update the post
    [Arguments]    ${body}
    ${url}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${body}     ${body}
    verify_schema    ${path_update_schema}    ${response}
    ${response_get}    custom_get    ${session}    ${url}    ${params}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Delete the post
    ${url}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    force=${data_delete}
    Log    ${response}
    verify_schema    ${path_delete_schema}    ${response}
    verify_subset    ${post_delete}    ${response}
