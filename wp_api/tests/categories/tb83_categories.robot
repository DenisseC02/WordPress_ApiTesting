*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session
Test Teardown    Delete Category    ${ID}

*** Variables ***

*** Test Cases ***
Verify is not possible create a category and edit it with inexistent parent
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_nonexistent_parent}    400
    Verify_Equal_Ignore    ${error_parent_does_not_exist}    ${response_put}
