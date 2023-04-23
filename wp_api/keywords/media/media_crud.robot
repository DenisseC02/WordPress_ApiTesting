*** Settings ***
Resource    media_keywords.robot
Variables    wp_api/resources/data/bodies/media.py


*** Keywords *** 
Create New Media File 
    [Arguments]     ${file}
    ${updated_session}    ${body}     update_session    session=${session}    file_path=${file}    expected_status=201
    ${response}     custom_post     session=${updated_session}     url=${url}     params=${params}     body=${body}    expected_status=201
    ${updated_session}    Set Variable    ${None}
    ${id}    get_key_value    ${response}    id 
    Set Global Variable     ${id}
    ${response_get}    custom_get    session=${session}    url=${url}/${id}    params={}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Get Media Files 
    [Arguments]     ${new_status}    ${new_url}=${url} 
    ${response}     custom_get     session=${session}     url=${new_url}     params=${params}     expected_status=${new_status}
    ${schema}    Set Variable If    '${new_url}' == '${url}'        ${path_to_schema}[get_all]    ${path_to_schema}[get]
    verify_schema    ${schema}    ${response}

Update Media File Info 
    [Arguments]     ${new_status}    ${params}    ${new_url}=${url}         
    ${response}     custom_put     session=${session}     url=${new_url}     params=${params}     body={}

Delete Media File 
    [Arguments]     ${new_status}    ${new_url}=${url}
    ${response}     custom_delete     session=${session}     url=${new_url}    params=force=1     expected_status=${new_status}
    ${response_get}    custom_get    session=${session}    url=${url}/${id}    params={}    expected_status=404
    verify_subset_ignore    ${response_get}    ${not_found_message}