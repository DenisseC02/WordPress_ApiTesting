*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session

*** Variables ***
${body1}=    ${body_complete}
${body2}=    ${body_complete2}

*** Test Cases ***
Verify it is not possible edit a category with a slug that already exist
    Create Category    ${body1}
    Create Category    ${body2}
    Obtain existent slug
    Edit category with existent slug

*** Keywords ***
Obtain existent slug
    ${slug}    get_key_value    ${body1}    slug
    ${body3}    create dictionary    slug=${slug}
    set global variable    ${body3}

Edit category with existent slug
    Update Category With Error    ${ID}    ${body3}    500
    ${code}    get_key_value    ${response_put}    code
    Verify_Equal_Ignore    duplicate_term_slug    ${code}
