*** Settings ***
Resource    wp_api/resources/imports.robot
Resource    media_crud.robot
Library    libraries.utils.random_dictionary_value.DictionaryRandomVaule
Library    libraries.requests.download_file.DownloadFile


*** Keywords ***
Create Test Suite Session  
    ${session}    ${params}    create_session
    Set Suite Variable    ${session}
    Set Suite Variable    ${params}
    ${url}    Generate Endpoint Url    media
    Logging   Test Suite Session has been created succesfully    ''
    [Return]    ${session}    ${params}    ${url} 

Generate Endpoint Url 
    [Arguments]    ${endpoint}
    ${url}    get_url    extra_path=${endpoint}
    Set Suite Variable    ${url}
    Logging    Endpoint URL was generated succesfully    ${url}
    [Return]    ${url}

Logging
    [Arguments]    ${message}    ${var}
    Log    **********\n${message} \n${var}\n**********

Get Random Value From Dictionary
    [Arguments]    ${dictionary}
    ${random_value}    get_random_dictionary_value    ${dictionary}
    [Return]    ${random_value}
