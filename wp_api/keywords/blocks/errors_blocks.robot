*** Settings ***
Library      libraries.requests.custom_request.CustomRequest
Library      libraries.authentication.custom_session.CustomSession
Library      libraries.process_data.url_assembler.UrlAssembler
Library      libraries.assertions.verification.Verification
Library      libraries.process_data.process_data.ProcessData
Library      wp_api.resources.data.bodies.body_generator.BodyGenerator
Variables    wp_api/resources/data/bodies/blocks.py

*** Variables ***
${end_point}    blocks

*** Keywords ***
Create Block with "${type}"
    ${body_data}    ${status}    data_generator    ${type}
    ${url}    get_url    path=${end_point}
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body_data}    ${status}    
    verify_schema    ${wrong_status_schema}    ${response}
    ${value}    get_key_value    ${response}    code
    Verify Equal Ignore    ${value}    rest_invalid_param
