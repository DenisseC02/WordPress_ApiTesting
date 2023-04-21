*** Settings *** 
Library      libraries.requests.custom_request.CustomRequest
Library      libraries.authentication.custom_session.CustomSession
Library      libraries.process_data.url_assembler.UrlAssembler
Library      libraries.assertions.verification.Verification
Library      libraries.process_data.process_data.ProcessData
Variables    wp_api/resources/data/json/blocks.py

*** Variables ***
${end_point}    blocks

*** Keywords *** 
Create Block
    [Arguments]    ${body_create}
    ${url}    get_url    path=${end_point}
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body_create}    201    
    verify_schema    ${create_block_schema}    ${response}
    ${id}    get_key_value    ${response}    id
    Set Global Variable    ${id}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response_get}    custom_get    ${session}    ${url}    ${params}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore}
Read Block
    [Arguments]    ${new_status}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_get    ${session}    ${url}    ${params}    ${new_status}
    verify_schema    ${read_block_schema}    ${response}

Update Block
    [Arguments]    ${body_update} 
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body_update}
    verify_schema    ${read_block_schema}    ${response}
    ${response_get}    custom_get    ${session}    ${url}    ${params}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore}
Delete Block
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_delete    ${session}    ${url}    ${delete}    
    ${response_get}    custom_get    ${session}    ${url}    ${params}    404
    verify_subset ignore    ${response_get}    ${verify_delete}    
Create Session And Authentication
    ${session}    ${params}     create_session
    Set Global Variable    ${session} 
    Set Global Variable    ${params}
Read all Blocks
    [Arguments]    ${extraurl}
    ${url}    get_url    path=${end_point}    filter=${extraurl}
    ${response}    custom_get    ${session}    ${url}    ${params}
Delete Session And Authentication
    Log    to do
