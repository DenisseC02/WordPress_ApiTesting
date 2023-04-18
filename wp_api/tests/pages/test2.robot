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
${title}    Public page!!

*** Test Cases ***
Verify that a public page can be edit
    Search the public page
    Edit the public page
    Verify that the changes are saved

*** Keywords ***
Search the public page
    ${url}    get url    end_point=${end_point_path}   
    ${response}    custom post    ${session}    ${url}    ${params}    ${body_test2_post}    ${expected_status}
    ${params}    Create Dictionary
    Set To Dictionary    ${params}    search=${title}
    ${id}    custom get    ${session}    ${url}    ${params}    response_type=key
    Set Global Variable    ${id}

Edit the public page
    ${url}    get url    end_point=${end_point_path}    id=${id}
    ${response}    custom put    ${session}    ${url}    ${params}    ${body_test2_put}

Verify that the changes are saved
    Log    'aqui la validacion desde el .py verificar que los datos cambiaron'
