*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Resource    ../../resources/imports.robot

*** Variables ***
${endpoint}    categories
${schemas_path}    wp_api/resources/data/schemas/categories

*** Keywords ***
Create New Session
    ${session}  ${params}    create_session
    Set Global Variable    ${session}
    Set Global Variable    ${params}

Get Category
    [Arguments]    ${id}    ${status}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: GET
    ${response_get}    custom_get    ${session}    ${url}/${id}    ${params}    ${status}
    Log    Response Get: ${response_get}
    Verify_Schema    ${schemas_path}/get_category.json    ${response_get}
    [Return]    ${response_get}

Get all Categories
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: GET
    ${response_get_all}    custom_get    ${session}    ${url}    ${params}
    Log    Response Get All: ${response_get_all}
    Verify_Schema    ${schemas_path}/get_all_categories.json    ${response_get_all}
    [Return]    ${response_get_all}

Create Category
    [Arguments]    ${body}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: POST
    ${response_create}  custom_post  ${session}  ${url}  ${params}  ${body}    201
    Verify_Schema    ${schemas_path}/create_category.json    ${response_create}
    log    Response Post: ${response_create}
    ${ID}    get_key_value    ${response_create}    id
    ${response_get}    Get Category    ${ID}    200
    Verify_Subset_Ignore    ${response_get}    ${body}
    [Return]    ${ID}    ${response_create}
#    set global variable    ${response_create}

Delete Category
    [Arguments]    ${id}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: DELETE
    ${params}    create dictionary    force=true
    ${response_delete}    custom_delete    ${session}    ${url}/${id}    ${params}
    Log    Response Delete: ${response_delete}
    Verify_Schema    ${schemas_path}/delete_category.json    ${response_delete}


Update Category
    [Arguments]    ${id}    ${body}
    ${url}    get_url    endpoint=${endpoint}
    Log    Endpoint used: ${url}
    Log    Method used: PUT
    ${response_put}    custom_put    ${session}    ${url}/${ID}    ${params}    ${body}
    log    Response Put: ${response_put}
    [Return]    ${response_put}
