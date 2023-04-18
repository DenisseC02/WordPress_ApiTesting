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

*** Test Cases ***
Verify that a public page can be saved as a draft
    Create a publish page
    Verify that the page is saved as publish
    Edit the page to save it as draft
    Verify that the page is update

*** Keywords ***
Create a publish page
    ${url}    get url    end_point=${end_point_path}   
    ${response}    custom post    ${session}    ${url}    ${params}    ${body_test3_post}    ${expected_status}

Verify that the page is saved as publish
    Log    'traer el id de la pagina anterior con el response'

Edit the page to save it as draft
    ${url}    get url    end_point=${end_point_path}    id=
    ${response}    custom put    ${session}    ${url}    ${params}    ${body_test3_put}

Verify that the page is update
    Log    'aqui la validacion desde el .py validar que sea draft ahora'
