*** Settings ***
Library  libraries.authentication.custom_session.CustomSession
Library  libraries.process_data.url_assembler.UrlAssembler

*** Keywords ***
Create Session and params
    ${session}  ${params}  create_session
    Set Global Variable     ${session}
    Set Global Variable    ${params}

Delete Created Pages
    [Teardown]    
    ${url}    get url    extra=${end_point_path}    id=${id}
    custom delete    ${session}    ${url}    ${params}
