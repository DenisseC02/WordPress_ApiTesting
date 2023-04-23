*** Settings ***
Documentation    Upload image, audio and video files to MEDIA library
Resource    wp_api/keywords/media/media_keywords.robot
Suite Setup    Create Test Suite Session

*** Variables ***


*** Test Cases ***
Verify If Its Possible To Upload Image, Audio And Video Files To Media Library
    Upload Audio, Image and Video

*** Keywords ***
Upload Audio, Image and Video
    ${image_file}    Get Random Value From Dictionary    ${image_files}    
    ${audio_file}    Get Random Value From Dictionary    ${audio_files}
    ${video_file}    Get Random Value From Dictionary    ${video_files}
    @{files_to_upload}    Create List    ${image_file}    ${audio_file}    ${video_file}
    FOR    ${file}    IN    @{files_to_upload}
        Create New Media File    ${file}
    END


