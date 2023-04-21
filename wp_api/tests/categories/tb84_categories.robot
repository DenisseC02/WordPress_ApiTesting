*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session
Test Teardown    Delete Category    ${ID}

*** Variables ***

*** Test Cases ***
Verify is not possible create a category and edit parent with its own id
    Create Category    ${body_complete}
    Edit Category with its own id as parent
    Verify parent is set automaticly as zero

*** Keywords ***
Edit Category with its own id as parent
    ${body_edit}    create dictionary    parent=${ID}
    Update Category    ${ID}    ${body_edit}

Verify parent is set automaticly as zero
    ${new_parent}    get_key_value    ${response_put}    parent
    Verify_Equal_Ignore    ${0}    ${new_parent}
