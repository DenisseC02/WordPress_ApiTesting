*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session
Test Teardown    Delete Category    ${ID}

*** Variables ***
${body}=    ${body_complete}
${body2}=    ${body_complete2}

*** Test Cases ***
Create a category and get it from list of categories
    Create Category    ${body}
    Get all Categories
    Search Category on List    ${ID}    ${response_get_all}    ${response_create}

*** Keywords ***
Search Category on List
    [Arguments]    ${ID}    ${response_get_all}    ${response_create}
    ${category}    search_element_in_list    id    ${ID}    ${response_get_all}
    verify_equal_ignore    ${category}    ${response_create}
