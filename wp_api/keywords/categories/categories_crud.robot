*** Settings ***
#Variables   wp_api/resources/config/config.py
#Variables    wp_api/resources/data/bodies/category.py
#Library  libraries.process_data.url_assembler.UrlAssembler
#Library    libraries.process_data.process_data.ProcessData
#Library     libraries.requests.custom_request.CustomRequest
#Library     libraries.authentication.custom_session.CustomSession
#Library    libraries.assertions.verification.Verification
#Library    libraries.utils.name_generator.NameGenerator
Resource    ../../resources/imports.robot

*** Variables ***
${endpoint}    categories
${schemas_path}    wp_api/resources/data/schemas/categories

*** Keywords ***
Create New Session
    ${session}  ${params}    create session
    Set Global Variable    ${session}
    Set Global Variable    ${params}

Get Category
    [Arguments]    ${id}    ${status}
    ${url}    get_url    endpoint=${endpoint}
    ${response_get}    custom_get    ${session}    ${url}/${id}    ${params}    ${status}
    Verify_Schema    ${schemas_path}/get_category.json    ${response_get}
    set global variable    ${response_get}

Get all Categories
    ${url}    get_url    endpoint=${endpoint}
    ${response_get_all}    custom_get    ${session}    ${url}    ${params}
    Verify_Schema    ${schemas_path}/get_all_categories.json    ${response_get_all}
    set global variable    ${response_get_all}

Create Category
    [Arguments]    ${body}
    ${url}    get_url    endpoint=${endpoint}
    ${response_create}  custom_post  ${session}  ${url}  ${params}  ${body}    201
    Verify_Schema    ${schemas_path}/create_category.json    ${response_create}
    log    Category Created: ${response_create}
    ${ID}    get_key_value    ${response_create}    id
    Get Category    ${ID}    200
    Verify_Subset_Ignore    ${response_get}    ${body}
    set global variable    ${ID}
    set global variable    ${response_create}

Delete Category
    [Arguments]    ${id}
    ${url}    get_url    endpoint=${endpoint}
    ${params}    create dictionary    force=true
    ${response_delete}    custom_delete    ${session}    ${url}/${id}    ${params}
    Verify_Schema    ${schemas_path}/delete_category.json    ${response_delete}


Update Category
    [Arguments]    ${id}    ${body}
    ${url}    get_url    endpoint=${endpoint}
    ${response_put}    custom_put    ${session}    ${url}/${ID}    ${params}    ${body}
    log    Edit response: ${response_put}
    set global variable    ${response_put}
