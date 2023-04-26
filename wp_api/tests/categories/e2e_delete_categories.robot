*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Setup Test Case
Force Tags    CATEGORIES    CATEGORIES_DELETE

*** Variables ***
${body_name}=    ${body_just_name}
${body_description}=    ${body_just_description}
${endpoint}=    categories

*** Test Cases ***
Delete inexistent category
    [Tags]    ERRORS
    Delete existent category
    Delete inexistent category

*** Keywords ***
Setup Test Case
    Create New Session
    ${id}    Obtain existent category
    set test variable    ${id}

Obtain First Category
    ${all_categories}    Get all Categories
    ${category}    get_key_value    ${all_categories}    ${0}
    ${id}    get_key_value    ${category}    id
    IF    '${id}' == '${1}'
        ${body_create}    create_body_category
        ${id}    ${new_category}    Create Category    ${body_create}
    END
    [Return]    ${id}

Obtain existent category
    ${all_categories}    Get all Categories
    ${length}    get length    ${all_categories}
    IF    '${length}' == '${0}'
        ${body_create}    create_body_category
        ${id}    ${new_category}    Create Category    ${body_create}
    ELSE
        ${id}    Obtain First Category
    END
    [Return]    ${id}

Delete existent category
    Delete Category    ${id}

Delete inexistent category
    Delete Category With Error    ${id}
