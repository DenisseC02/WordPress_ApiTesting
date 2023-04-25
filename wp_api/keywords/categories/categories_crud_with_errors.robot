*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Resource    ../../resources/imports.robot

*** Variables ***
${endpoint}    categories

*** Keywords ***

Get Category With error
    [Arguments]    ${id}    ${status}    ${error}=${error_term_does_not_exist}    ${session}=${session}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: GET
    ${response_get}    custom_get    ${session}    ${url}/${id}    ${params}    ${status}
    log    Response Get: ${response_get}
    verify_equal_ignore    ${response_get}    ${error}

Create Category With Error
    [Arguments]    ${body}    ${error}    ${status}=400
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: POST
    ${response_create_error}  custom_post  ${session}  ${url}  ${params}  ${body}    ${status}
    log    Response Post: ${response_create_error}
    verify_subset_ignore    ${response_create_error}    ${error}
    [Return]    ${response_create_error}


Delete Category With Error
    [Arguments]    ${id}    ${status}=404    ${error}=${error_term_does_not_exist}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: DELETE
    ${params}    create dictionary    force=true
    ${response_delete}    custom_delete    ${session}    ${url}/${id}    ${params}    ${status}
    log    Response Delete: ${response_delete}
    verify_equal_ignore    ${response_delete}    ${error}
    [Return]    ${response_delete}


Update Category With Error
    [Arguments]    ${id}    ${body}    ${status}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: PUT
    ${response_put}    custom_put    ${session}    ${url}/${ID}    ${params}    ${body}    ${status}
    log    Response Put: ${response_put}
    [Return]    ${response_put}

Verify response returns an error message
    [Arguments]    ${body_error}
    ${code_error}    get_key_value    ${body_error}    code
    ${code_error_from_response}    get_key_value    ${response}    code
    verify_equal_ignore    ${code_error}    ${code_error_from_response}
