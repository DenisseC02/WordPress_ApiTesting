*** Settings ***
Library  libraries.authentication.custom_session.CustomSession
Library  libraries.process_data.url_assembler.UrlAssembler

*** Variables ***
${end_point_pages}    pages

*** Keywords ***
Create Session and params
    ${session}  ${params}  create_session
    Set Global Variable     ${session}
    Set Global Variable    ${params}

Delete Created Pages
    [Teardown]    
    ${url}    get_url    extra=${end_point_pages}    id=${id}
    custom_delete    ${session}    ${url}    ${params}