*** Settings ***
Variables    wp_api/resources/config/config.py
Library  libraries.requests.custom_request.CustomRequest
Library  libraries.authentication.custom_session.CustomSession
Library  libraries.process_data.url_assembler.UrlAssembler
Resource    ../../keywords/run.robot
Test Setup    Create Session and params
Test Teardown    Delete Created Pages
Variables    wp_api/resources/data/json/pages.py
Library    ../../../venv/lib/site-packages/robot/libraries/Process.py
Library    ../../../venv/lib/site-packages/robot/libraries/Collections.py

*** Variables ***
${end_point_path}    pages
${expected_status}    201
${status}    draft 

*** Test Cases ***
Verify that a draft page can be published
    ${expected_response}    Create new page and save it as draft    
    ${actual_response}    Verify that the page was created
    Update the page and change the status to publish


*** Keywords ***
Create new page and save it as draft
    ${url}    get url    end_point=${end_point_path}    
    ${response}    custom post    ${session}    ${url}    ${params}    ${body_test1_post}    ${expected_status}
    [Return]    ${response}

Verify that the page was created
    ${params}    Create Dictionary
    Set To Dictionary    ${params}    status=${status}
    ${url}    get url    end_point=${end_point_path}
    ${id}    custom get    ${session}    ${url}    ${params}    response_type=key
    Set Global Variable    ${id}
    ${url}    get url    end_point=${end_point_path}    id=${id}
    ${response}    custom get    ${session}    ${url}    ${params}
    [Return]    ${response}

Update the page and change the status to publish
    ${url}    get url    end_point=${end_point_path}    id=${id}
    ${response}    custom put    ${session}    ${url}    ${params}    ${body_test1_put}
