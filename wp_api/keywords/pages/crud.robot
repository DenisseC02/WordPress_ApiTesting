*** Settings ***
Library  libraries.process_data.url_assembler.UrlAssembler
Library  libraries.requests.custom_request.CustomRequest
Library  libraries.authentication.custom_session.CustomSession
Library    libraries.process_data.process_data.ProcessData
Library    libraries.assertions.verification.Verification
Library    libraries.assertions.pages_verification.PagesVerification
Variables    ../../resources/data/json/pages.py
*** Variables ***
${expected_status}    201
${end_point_pages}    pages

*** Keywords ***
Create new page
    [Arguments]    ${body} 
    ${url}    get_url    end_point=${end_point_pages}
    Log    ${url}   
    ${response}    custom_post    ${session}    ${url}    ${params}    ${body}    ${expected_status}
    Log    ${response}
    ${id}    get_key_value    ${response}    id
    Set Global Variable    ${id}
    ${url_get}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response_get}    custom_get    ${session}    ${url_get}    ${params}    
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Retrieve the page
    [Arguments]    ${new_status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    ${params}    ${new_status}
    Log    ${response}
    verify_schema    ${path_json_schema}    ${response}

Update the page
    [Arguments]    ${body}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}
    ${response_get}    custom_get    ${session}    ${url}    ${params}    
    verify_equal_ignore    ${response}    ${response_get}    ${ignore_list}

Delete the page
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_delete    ${session}    ${url}    ${params}
    Log To Console    ${response}
    ${response_delete}    custom_get    ${session}    ${url}    ${params}
    Log To Console    ${response_delete}
    verify_subset    ${page_status}    ${response_delete}    
