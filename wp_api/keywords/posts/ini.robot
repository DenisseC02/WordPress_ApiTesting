*** Settings ***
Library      libraries.authentication.custom_session.CustomSession
Library      libraries.process_data.process_data.ProcessData
Library      libraries.process_data.url_assembler.UrlAssembler

*** Variables ***
${end_point_posts}      posts

*** Keywords ***
Create session and params
    ${session}     ${params}        create_session
    Set Global Variable    ${session}
    Set Global Variable    ${params}
