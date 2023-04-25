*** Settings ***
Library      libraries.requests.custom_request.CustomRequest
Library      libraries.authentication.custom_session.CustomSession
Library      libraries.process_data.url_assembler.UrlAssembler
Library      libraries.assertions.verification.Verification
Library      libraries.process_data.process_data.ProcessData
Library      wp_api.resources.data.bodies.block_body_generator.BodyGenerator
Variables    wp_api/resources/data/bodies/blocks.py

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
    [Arguments]    ${new_status}    ${filter}    ${key}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_get    ${session}    ${url}    ${params}    ${new_status}    ${filter}    ${key}
    RETURN    ${response}
    
Update Block
    [Arguments]    ${body_update}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_put    ${session}    ${url}    ${body_update}    ${params}
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
    [Arguments]    ${filter_by}
    ${url}    get_url    path=${end_point}
    ${response}    custom_get    ${session}    ${url}    ${params}
    Set Global Variable    ${response}
    
Get Blocks List
    ${url}    get_url    path=${end_point}    per_page=?per_page=100&status=publish,future,draft,pending,private
    ${ids}    custom_get    ${session}    ${url}    ${params}    response_type=key    extra_param=id
    Set Test Variable    ${ids}

Get list of block ${filter}s
    ${url}    get_url    path=${end_point}    per_page=?per_page=100
    ${ids}    custom_get    ${session}    ${url}    ${params}    response_type=key    extra_param=${filter}
    Set Test Variable    ${ids}

Delete all the blocks Created
    FOR    ${id}    IN    @{ids}
        Update id Block    $body_update    ${id}
        Delete block ${id}
    END

Delete block ${id}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_delete    ${session}    ${url}    ${delete}    
    ${response_get}    custom_get    ${session}    ${url}    ${params}    404
    verify_subset ignore    ${response_get}    ${verify_delete}

Delete Session And Authentication
    Log    to do

Update Id Block
    [Arguments]    ${publish}     ${id}
    ${url}    get_url    path=${end_point}    id=${id}
    ${response}    custom_put    ${session}    ${url}    ${body_update}    ${params}
    verify_schema    ${read_block_schema}    ${response}
    ${response_get}    custom_get    ${session}    ${url}    ${params}
    verify_equal_ignore    ${response}    ${response_get}    ${ignore}

Create ${blocks} ${type} Blocks
    ${data_block}    block_body    ${type}    
    FOR    ${block}    IN RANGE    ${blocks}
        Create Block    ${data_block} 
    END

List Should Contain The ${blocks} Blocks Created
    log    ${ids}
    Verify List Is Len    ${ids}    ${blocks}

Update The ${feature} Of The Block
    ${params}    block_body    ${feature}
    Set Test Variable    ${params}
    Update Block    ${params}
Verify That The ${feature} Is Updated
    FOR    ${id}    IN    @{ids}
        ${data}    Read Block    200    key    ${feature}
        ${expected}    Set Variable    ${params}[${feature}]
        Verify Equal Ignore    ${data}    ${expected}    
    END
