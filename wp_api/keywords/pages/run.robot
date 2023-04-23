*** Settings ***
Resource    ../../resources/imports.robot

*** Variables ***
${end_point_pages}    pages

*** Keywords ***
Create Session and params
    ${session}  ${params}  create_session
    Set Suite Variable    ${session}
    Set Suite Variable    ${params}

Delete Created Pages
    [Teardown]    
    ${url}    get_url    extra=${end_point_pages}    id=${id}
    custom_delete    ${session}    ${url}    ${params}
