*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session
Test Teardown    Delete Category    ${ID}

*** Variables ***
${body_1}=    ${body_just_name}
${body_2}=    ${body_just_description}


*** Test Cases ***
Verify is possible create a category without description and add it with update
    Create Category    ${body_1}
    Update Category    ${ID}    ${body_2}
    Get Category    ${ID}    200
    Verify_Subset_Ignore    ${response_get}    ${body_2}
