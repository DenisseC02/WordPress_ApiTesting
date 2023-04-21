*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session

*** Variables ***
${body}    ${body_complete}

*** Test Cases ***
Delete inexistent category
    Create Category    ${body}
    Delete Category    ${ID}
    Delete Category With Error    ${ID}
