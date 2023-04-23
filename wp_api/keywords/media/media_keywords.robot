*** Settings ***
Resource    wp_api/resources/imports.robot
Resource    media_crud.robot
Library    libraries.utils.random_dictionary_value.DictionaryRandomVaule

*** Keywords ***
Create Test Suite Session  
    ${session}    ${params}    create_session
    Set Global Variable    ${session}
    Set Global Variable    ${params}
    Logging   Test Suite Session has been created succesfully    ''
    Generate Endpoint Url and Set as Global Variable    media

Generate Endpoint Url and Set as Global Variable 
    [Arguments]    ${param}
    ${url}    get_url    extra_path=${param}
    Set Global Variable    ${url}
    Logging    Endpoint URL was generated succesfully    ${url}

Logging
    [Arguments]    ${message}    ${var}
    Log    **********\n${message} \n${var}\n**********

Get Random Value From Dictionary
    [Arguments]    ${dictionary}
    ${random_value}    get_random_dictionary_value    ${dictionary}
    [Return]    ${random_value}


