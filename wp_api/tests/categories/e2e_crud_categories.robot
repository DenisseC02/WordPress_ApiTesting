*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Setup Test Case
Force Tags    SMOKE    CATEGORIES    CATEGORIES_

*** Variables ***
${body_name}=    ${body_just_name}
${body_description}=    ${body_just_description}
${endpoint}=    categories

*** Test Cases ***
Verify is posible create list edit and delete a category
    [Tags]    CREATE_CATEGORIES    UPDATE_CATEGORIES    DELETE_CATEGORIES
    Create new category
    Get Category    ${id}
    Update existent category
    Delete Category    ${id}
    Log    Verify category was deleted:
    Get Category With error    ${id}    404

*** Keywords ***
Setup Test Case
    Create New Session

Update existent category
    ${body_update}    create_body_category
    Update Category    ${id}    ${body_update}

Create new category
    ${body_create}    create_body_category
    ${id}    ${new_category}    Create Category    ${body_create}
    set test variable    ${id}
    set test variable    ${new_category}
