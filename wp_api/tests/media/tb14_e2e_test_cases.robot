*** Settings ***
Documentation    WordPress MEDIA endpoint Testing.
Resource    wp_api/keywords/media/media_keywords.robot
Suite Setup    Create Test Suite Session
Library    OperatingSystem
Force Tags    MEDIA

*** Test Cases ***
Verify If Its Possible To Upload Image, Audio And Video Files To Media Library
    [Tags]    smoke
    Upload Audio, Image, Video and Verify That Exists in Media Library

Verify if an image bigger than 1024x1024 pixels can be uploaded.
    [Tags]    smoke
    Upload image > 1024x1024 pixels
    [Teardown]    Delete Media File     200    ${url}/${id}

Verify that a pdf document bigger than 2MB can not be uploaded.
    [Tags]    smoke    known
    Upload PDF document > 2MB
    
    

Verify that is possible to add ALT TEXT to an existing image.
    [Tags]    update
    Upload A Random Image
    Get The Actual Description Content
    Update ALT TEXT Field With the text     Hello from media test suite.    alt_text
    Verify if Description Content Has Changed
    [Teardown]    Delete Media File     200    ${url}/${id}

Verify if its possible download a media file as external user.
    Upload A Random Image
    Get Public Direct Link
    Download The File Using The Link
    Verify If The File Exists On Local Disk
    [Teardown]    Delete Remote and Local Files

Verify if a ZIP compressed file can be uploaded to the library.
    [Tags]    update
    Upload A ZIP File
    Verify That the ZIP File Exists In Media Library
    [Teardown]    Delete Media File     200    ${url}/${id}

Verify that an image can be uploaded, viewed, modified filename and deleted from media library.
    Upload A Random Image
    Update filename Field With the text     new_image_name    title
    Verify if Description Content Has Changed
    [Teardown]    Delete Media File     200    ${url}/${id}    

*** Keywords ***
Upload File
    [Arguments]    ${file_to_upload}    ${expected_status}
    Create New Media File    ${file_to_upload}    ${expected_status}

Upload image > 1024x1024 pixels
    Create New Media File    ${image_files}[image_01]    201

Upload PDF document > 2MB
    Create New Media File    ${other_files}[file_05]    500

Upload A Random Image
    ${image_to_upload}    Get Random Value From Dictionary     ${image_files}
    Create New Media File    ${image_to_upload}    201

Upload A ZIP File
    Create New Media File    ${other_files}[file_06]    201

Get Value
    [Arguments]    ${key}
    ${response}    Get Media Files    200    ${url}/${id}
    ${value}    get_key_value    ${response}    ${key}
    Set Suite Variable    ${result}    ${value}

Get The Actual Description Content
    Get Value    alt_text

Get Public Direct Link
    Get Value    source_url

Update ALT TEXT Field With the text
    [Arguments]    ${update_text}    ${field}
    Update Field With the text    ${update_text}    ${field}

Update filename Field With the text
    [Arguments]    ${update_text}    ${field}
    Update Field With the text    ${update_text}    ${field}

Update Field With the text
    [Arguments]    ${update_text}    ${field}
    Set Suite Variable    ${new_description}    ${update_text}
    Update Media File Info    204    '${field}'=${update_text}    ${url}/${id}

Verify if Description Content Has Changed
    Should Not Be Equal As Strings    ${result}    ${new_description}

Download The File Using The Link
    ${download_dir}    download    ${result}
    Set Suite Variable    ${file_path}    ${download_dir}

Delete Remote and Local Files
    Delete Media File     200    ${url}/${id}
    delete_local_file    ${file_path}    

Verify If The File Exists On Local Disk
    File Should Exist    ${file_path}

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
