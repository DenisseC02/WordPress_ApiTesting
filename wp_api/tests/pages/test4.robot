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
${end_point_user}    user
${expected_status}    201

*** Test Cases ***
Verify that a user has access to a page with a password
    Create a suscriber user
    Create a page with password
    Verify that the admin user has access

*** Keywords ***
Create a suscriber user
    ${url}    get url    end_point=${end_point_user}
    ${response}    custom post    ${session}    ${url}    ${params}    ${body_test4_user}    ${expected_status}
    Log To Console    ${response}

Create a page with password
    ${url}    get url    end_point=${end_point_path}
    ${response}    custom post    ${session}    ${url}    ${params}    ${body_test4_post}    ${expected_status}
    Log    'aqui llamar a la funcion para sacar la id del response'

Verify that the admin user has access
    ${url}    get url    end_point=${end_point_path}    id=
    ${response}    custom get    ${session}    ${url}    ${params}
    Log    'verificar '
