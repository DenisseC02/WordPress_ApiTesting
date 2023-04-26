*** Settings ***
Documentation    WordPress MEDIA endpoint Testing.
Resource    wp_api/keywords/media/media_keywords.robot
Suite Setup    Create Test Suite Session
Library    OperatingSystem
Force Tags    MEDIA    MEDIA_UPDATE

*** Test Cases ***
Verify that is possible to add ALT TEXT to an existing image.
    Upload A Random Image
    Get The Actual Description Content
    Update ALT TEXT Field With the text     Hello from media test suite.    alt_text
    Verify if Description Content Has Changed
    [Teardown]    Delete Media File     200    ${url}/${id}

*** Keywords ***
Upload A Random Image
    ${image_to_upload}    Get Random Value From Dictionary     ${image_files}
    Create New Media File    ${image_to_upload}    201

Get Value
    [Arguments]    ${key}
    ${response}    Get Media Files    200    ${url}/${id}
    ${value}    get_key_value    ${response}    ${key}
    Set Suite Variable    ${result}    ${value}

Get The Actual Description Content
    Get Value    alt_text

Update ALT TEXT Field With the text
    [Arguments]    ${update_text}    ${field}
    Update Field With the text    ${update_text}    ${field}

Update Field With the text
    [Arguments]    ${update_text}    ${field}
    Set Suite Variable    ${new_description}    ${update_text}
    Update Media File Info    204    '${field}'=${update_text}    ${url}/${id}

Verify if Description Content Has Changed
    Should Not Be Equal As Strings    ${result}    ${new_description}
