*** Settings ***
Resource    wp_api/keywords/media/media_keywords.robot
Library    OperatingSystem
Variables    wp_api/resources/data/bodies/users.py
Resource    wp_api/resources/imports.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test Users And Media
Test Teardown    Teardown Testcase
Force Tags    INTEGRATION     USERS    MEDIA    USERS_MEDIA     CREATE

*** Test Cases ***
Verify If Administrator User Can Upload Image, Audio And Video Files To Media Library
    [Tags]    ADMINISTRATOR_ROLE
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Audio, Image, Video and Verify That Exists in Media Library

Verify If Editor User Can Upload Image, Audio And Video Files To Media Library
    [Tags]    EDITOR_ROLE
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Audio, Image, Video and Verify That Exists in Media Library

Verify If Author User Can Upload Image, Audio And Video Files To Media Library
    [Tags]    AUTHOR_ROLE
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Audio, Image, Video and Verify That Exists in Media Library

Verify If Subscriber User Can Not Upload Image Files To Media Library
    [Tags]    SUBSCRIBER_ROLE
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Image With subscriber User
    Verify response returns an error message    ${error_user_create}

Verify If Subscriber User Can Not Upload Audio Files To Media Library
    [Tags]    SUBSCRIBER_ROLE
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Audio With subscriber User
    Verify response returns an error message    ${error_user_create}

Verify If Subscriber User Can Not Upload Video Files To Media Library
    [Tags]    SUBSCRIBER_ROLE
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Video With subscriber User
    Verify response returns an error message    ${error_user_create}

Verify If Contributor User Can Not Upload Image Files To Media Library
    [Tags]    CONTRIBUTOR_ROLE
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Image With subscriber User
    Verify response returns an error message    ${error_user_create}

Verify If Contributor User Can Not Upload Audio Files To Media Library
    [Tags]    CONTRIBUTOR_ROLE
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Audio With subscriber User
    Verify response returns an error message    ${error_user_create}

Verify If Contributor User Can Not Upload Video Files To Media Library
    [Tags]    CONTRIBUTOR_ROLE
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Upload Video With subscriber User
    Verify response returns an error message    ${error_user_create}

*** Keywords ***
Setup Test Users And Media
    Setup Test
    Create Test Suite Session

Teardown Testcase
    Delete Created User    ${admin_session}   ${response_user}

Upload Audio, Image, Video and Verify That Exists in Media Library
    ${image_file}    Get Random Value From Dictionary    ${image_files}
    ${audio_file}    Get Random Value From Dictionary    ${audio_files}
    ${video_file}    Get Random Value From Dictionary    ${video_files}
    @{files_to_upload}    Create List    ${image_file}    ${audio_file}    ${video_file}
    FOR    ${file}    IN    @{files_to_upload}
        Create New Media File    ${file}    201
        Delete Media File     200    ${url}/${id}
    END

Upload ${file_type} With ${role} User
    IF    '${file_type}'=='Image'
        ${file}    Get Random Value From Dictionary    ${image_files}
    ELSE IF    '${file_type}'=='Audio'
        ${file}    Get Random Value From Dictionary    ${audio_files}
    ELSE
        ${file}    Get Random Value From Dictionary    ${video_files}
    END
    ${response}    Create New Media File With Error    ${file}    403
    Set Test Variable    ${response}

Verify response returns an error message
    [Arguments]    ${body_error}
    ${code_error}    get_key_value    ${body_error}    code
    ${code_error_from_response}    get_key_value    ${response}    code
    verify_equal_ignore    ${code_error}    ${code_error_from_response}
