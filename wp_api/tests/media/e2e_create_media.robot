*** Settings ***
Documentation    WordPress MEDIA endpoint Testing.
Resource    wp_api/keywords/media/media_keywords.robot
Library    OperatingSystem
Suite Setup    Create Test Suite Session
Force Tags    MEDIA    MEDIA_CREATE

*** Test Cases ***
Verify If Its Possible To Upload Image, Audio And Video Files To Media Library
    Upload Audio, Image, Video and Verify That Exists in Media Library

Verify if an image bigger than 1024x1024 pixels can be uploaded.
    Upload image > 1024x1024 pixels
    [Teardown]    Delete Media File     200    ${url}/${id}

Verify if a pdf document bigger than 2MB can not be uploaded.
    [Tags]    ERRORS
    Upload PDF document > 2MB

Verify if a ZIP compressed file can be uploaded to the library.
    Upload A ZIP File
    Verify That the ZIP File Exists In Media Library
    [Teardown]    Delete Media File     200    ${url}/${id}

*** Keywords ***
Upload image > 1024x1024 pixels
    Create New Media File    ${image_files}[image_01]    201

Upload PDF document > 2MB
    Create New Media File    ${other_files}[file_05]    500

Upload A ZIP File
    Create New Media File    ${other_files}[file_06]    201

Update Field With the text
    [Arguments]    ${update_text}    ${field}
    Set Suite Variable    ${new_description}    ${update_text}
    Update Media File Info    204    '${field}'=${update_text}    ${url}/${id}

Verify That the ZIP File Exists In Media Library
    Get Media Files    200    ${url}/${id}
    

Upload Audio, Image, Video and Verify That Exists in Media Library
    ${image_file}    Get Random Value From Dictionary    ${image_files}
    ${audio_file}    Get Random Value From Dictionary    ${audio_files}
    ${video_file}    Get Random Value From Dictionary    ${video_files}
    @{files_to_upload}    Create List    ${image_file}    ${audio_file}    ${video_file}
    FOR    ${file}    IN    @{files_to_upload}
        Create New Media File    ${file}    201
        Delete Media File     200    ${url}/${id}
    END
