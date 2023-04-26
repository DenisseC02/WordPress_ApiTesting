*** Settings ***
Resource    ../../resources/imports.robot
Variables     wp_api/resources/data/bodies/posts.py

*** Variables ***
${expected_status}      201
${end_point_posts}      posts
${data_delete}          true
${post_status}

*** Keywords ***
Create session and params
    ${session}     ${params}        create_session
    Set Suite Variable    ${session}
    Set Suite Variable    ${params}

Create new post
    [Arguments]    ${body}
    ${url}   get_url    posts=${end_point_posts}
    Log     ${url}
    ${response}  custom_post   ${session}   ${url}     ${params}     ${body}     ${expected_status}
    ${id}    get_key_value    ${response}   id
    verify_schema    ${path_create_schema}    ${response}
    Set Test Variable    ${id}
    ${url_get}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url_get}
    ${response_get}    custom_get    ${session}    ${url_get}    ${params}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Retrieve the post
    [Arguments]     ${new_status}
    ${url}      get_url      end_point=${end_point_posts}      id=${id}
    Log     ${url}
    ${response}     custom_get     ${session}      ${url}      ${params}      ${new_status}
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

Get post list
    ${url}    get_url    path=${end_point_posts}    per_page=?per_page=100&status=publish,future,draft,pending,private
    ${ids}    custom_get    ${session}    ${url}    ${params}    response_type=key    extra_param=id
    Set Suite Variable    ${ids}

Delete Posts Created
    Get post list
    FOR    ${id}    IN    @{ids}
        Delete post    ${id}
    END

Delete post
    [Arguments]    ${id}
    ${url}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    force=${data_delete}
    ${response_get}    custom_get    ${session}    ${url}    ${params}    404
    verify_subset_ignore    ${response_get}    ${message_deleted}