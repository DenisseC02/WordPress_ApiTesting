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
    ${url}    get url    path=${end_point}
    ${response}    Custom post    ${session}    ${url}    ${params}    ${body_create}    201    
    Verify Schema    ${create_block_schema}    ${response}
    ${id}    Get Key Value    ${response}    id
    Set Global Variable    ${id}
    ${url}    get url    path=${end_point}    id=${id}
    ${response_get}    Custom get    ${session}    ${url}    ${params}
    Verify Equal Ignore    ${response}    ${response_get}    ${ignore}
Read Block
    [Arguments]    ${new_status}
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom get    ${session}    ${url}    ${params}    ${new_status}
    Verify Schema    ${read_block_schema}    ${response}

Update Block
    [Arguments]    ${body_update} 
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom Put    ${session}    ${url}    ${params}    ${body_update}
    Verify Schema    ${read_block_schema}    ${response}
    ${response_get}    Custom get    ${session}    ${url}    ${params}
    Verify Equal Ignore    ${response}    ${response_get}    ${ignore}
Delete Block
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom Delete    ${session}    ${url}    ${delete}    
    ${response_get}    Custom get    ${session}    ${url}    ${params}    404
    Verify Subset Ignore    ${response_get}    ${verify_delete}    
Create Session And Authentication
    ${session}    ${params}     create session
    Set Global Variable    ${session} 
    Set Global Variable    ${params}

Delete Session And Authentication
    Log    to do