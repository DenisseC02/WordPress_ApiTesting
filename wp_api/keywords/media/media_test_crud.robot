*** Settings ***
Documentation    WordPress MEDIA endpoint CRUD Testing (Image file).
Resource    media_keywords.robot

Suite Setup    Create Test Suite Session

*** Test Cases ***
Verify All The Media Library Content
    Get All Media Library Content

Verify That A File Can Be Uploaded To The Media Library
    Upload Specific Media File

Verify That Recently Uploaded Media File Exists In The Library
    Get Specific Media File by ID

Verify That Alt Text Can Be Changed To Recently Uploaded Media File
    Update Alt Text to Media File 

Verify That Existing Media File Can Be Deleted From The Media Library
    Delete Specific Media File By ID

*** Keywords ***
Get All Media Library Content
    Get Media Files    200

Get Specific Media File By ID
    Get Media Files    200    ${url}/${id}

Upload Specific Media File
    Create New Media File     ${image_files}[image_03]

Update Alt Text to Media File
    ${params}    Set Variable    alt_text=Modern Red Car
    Update Media File Info    204    ${params}    ${url}/${id}

Delete Specific Media File By ID
    Delete Media File   200    ${url}/${id}
