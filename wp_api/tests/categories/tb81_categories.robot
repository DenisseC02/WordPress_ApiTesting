*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session

*** Variables ***
${body}=    ${body_complete}
${body2}=    ${body_complete2}

*** Test Cases ***
Create a category edit and delete it
    Create Category    ${body}
    Update Category    ${ID}    ${body2}
    Delete Category    ${ID}
    Get Category With error    ${ID}    404
