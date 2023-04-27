*** Settings ***
Documentation    WordPress MEDIA endpoint Testing.
Resource    wp_api/keywords/media/media_keywords.robot
Library    OperatingSystem
Suite Setup    Create Test Suite Session
Force Tags    MEDIA    MEDIA_GET

*** Test Cases ***
Verify if its possible download a media file as external user.
    Upload A Random Image
    Get Public Direct Link
    Download The File Using The Link
    Verify If The File Exists On Local Disk
    [Teardown]    Delete Remote and Local Files

*** Keywords ***
Upload A Random Image
    ${image_to_upload}    Get Random Value From Dictionary     ${image_files}
    Create New Media File    ${image_to_upload}    201

Get Value
    [Arguments]    ${key}
    ${response}    Get Media Files    200    ${url}/${id}
    ${value}    get_key_value    ${response}    ${key}
    Set Suite Variable    ${result}    ${value}

Get Public Direct Link
    Get Value    source_url

Update Field With the text
    [Arguments]    ${update_text}    ${field}
    Set Suite Variable    ${new_description}    ${update_text}
    Update Media File Info    204    '${field}'=${update_text}    ${url}/${id}

Download The File Using The Link
    ${download_dir}    download    ${result}
    Set Suite Variable    ${file_path}    ${download_dir}

Delete Remote and Local Files
    Delete Media File     200    ${url}/${id}
    delete_local_file    ${file_path}    

Verify If The File Exists On Local Disk
    File Should Exist    ${file_path}
