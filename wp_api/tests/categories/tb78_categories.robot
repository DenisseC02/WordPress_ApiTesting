*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create_New_Session
Test Teardown    Delete Category    ${ID}

*** Variables ***
${body}=    ${body_complete}
${error}=    ${error_term_exist}


*** Test Cases ***
Verify is not possble Create Two Categories With The Same Name Slug And Parent
    Create Category    ${body}
    Create Category With Error    ${body}    ${error}