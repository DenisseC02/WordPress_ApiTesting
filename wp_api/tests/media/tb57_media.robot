*** Settings ***
Documentation    Upload image more than 1024x1024 pixels to MEDIA library
Resource    wp_api/keywords/media/media_keywords.robot
Suite Setup    Create Test Suite Session

*** Variables ***


*** Test Cases ***
Verify if an image bigger than 1024x1024 pixels can be uploaded.
    Create New Media File    ${image_files}[image_01]


