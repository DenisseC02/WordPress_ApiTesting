*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create_New_Session

*** Variables ***
${body}    ${body_just_description}

*** Test Cases ***
Verify is not possible create a category without name
    Create Category With Error    ${body}    ${error_missing_name}
    Verify Error Message

*** Keywords ***
Verify Error Message
    ${message}    get_key_value    ${response_create_error}    message
    verify_equal_ignore    Missing parameter(s): name    ${message}
