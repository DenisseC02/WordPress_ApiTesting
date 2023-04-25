*** Settings ***
Variables    wp_api/resources/data/bodies/users.py
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    wp_api/resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot

*** Keywords ***
Create valid category
    ${body}    create_body_category
    ${category_id}    ${category}    Create Category    ${body}
    set suite variable    ${category_id}
    set suite variable    ${category}

Obtain existent category
    Create valid category

Create category with invalid user
    ${body}    create_body_category
    ${response}    create category with error    ${body}    ${error_user_create}    403
    set suite variable    ${response}

Verify if category was created succefully
    ${response_get}    Get Category    ${category_id}
    verify_equal_ignore    ${response_get}    ${category}

Update existent category
    ${body_update}    create_body_category
    ${response_update}    Update Category    ${category_id}    ${body_update}
    set suite variable    ${category_id}
    set suite variable    ${category}


Update existent category with invalid user
    ${body_update}    create_body_category
    ${response}    Update Category With Error    ${category_id}    ${body_update}    403
    set suite variable    ${response}


Delete existent category
    ${response}    Delete Category    ${category_id}

Delete existent category with invalid user
    ${response}    Delete Category With Error    ${category_id}    403    ${error_user_delete}
    set suite variable    ${response}

Verify category was deleted
    Get Category With error    ${category_id}    404
