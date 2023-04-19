*** Settings ***
Resource    ../../resources/imports.robot

*** Variables ***
${endpoint}    categories
${schemas_path}    wp_api/resources/data/schemas

*** Keywords ***
Create New Session
    ${session}  ${params}    create session
    Set Global Variable    ${session}
    Set Global Variable    ${params}

Create Category
    [Arguments]    ${body}
    ${url}    get url    endpoint=${endpoint}
    ${response_create}  custom post  ${session}  ${url}  ${params}  ${body}    201
    ${ID}    get key value    ${response_create}    id
    set global variable    ${ID}
    set global variable    ${response_create}

Create Category With Error
    [Arguments]    ${body}
    ${url}    get url    endpoint=${endpoint}
    ${response_create_error}  custom post  ${session}  ${url}  ${params}  ${body}    400
    set global variable    ${response_create_error}

Delete Category
    [Arguments]    ${id}
    ${url}    get url    endpoint=${endpoint}
    ${params}    create dictionary    force=true
    custom delete    ${session}    ${url}/${id}    ${params}

Get Category
    [Arguments]    ${id}    ${status}
    ${url}    get url    endpoint=${endpoint}
    ${response_get}    custom get    ${session}    ${url}/${id}    ${params}    ${status}
#    test assertions    ${schemas_path}/get_category.json    ${response_get}
    set global variable    ${response_get}

Update Category
    [Arguments]    ${id}    ${body}
    ${url}    get url    endpoint=${endpoint}
    ${response_put}    custom put    ${session}    ${url}/${ID}    ${params}    ${body}
    set global variable    ${response_put}