*** Settings *** 
Library      libraries.requests.custom_request.CustomRequest
Library      libraries.authentication.custom_session.CustomSession
Library      libraries.process_data.url_assembler.UrlAssembler
Library      libraries.assertions.verification.Verification 
Library      libraries.process_data.process_data.ProcessData
Variables    wp_api/resources/data/jsons/body_blocks.py

*** Variables ***

${end_point}    blocks


*** Keywords ***
Create Block
    ${url}    get url    path=${end_point}
    ${response}    Custom post    ${session}    ${url}    ${params}    ${body_create}    201    
    Verify Schema    ${create_block_schema}    ${response}
    ${id}    Get Key Value    ${response}    id
    Set Global Variable    ${id}
Read Block
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom get    ${session}    ${url}    ${params}    
    Verify Schema    ${read_block_schema}    ${response}
    

Update Block
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom Put    ${session}    ${url}    ${params}    ${body_update}        
    Verify Schema    ${read_block_schema}    ${response}

Delete Block
    ${url}    get url    path=${end_point}    id=${id}
    ${response}    Custom Delete    ${session}    ${url}    ${params}    
    Verify Schema    ${read_block_schema}    ${response}

create sessionss
    ${session}    ${params}     create session
    Set Global Variable    ${session} 
    Set Global Variable    ${params}
