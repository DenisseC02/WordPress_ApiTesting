*** Settings ***
Force Tags    CATEGORIES
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Setup Test Case
Test Teardown    Delete Categories

*** Variables ***
${body_name}=    ${body_just_name}
${body_description}=    ${body_just_description}
${endpoint}=    categories

*** Test Cases ***
Verify is possible create a category without description and add it with update
    [Tags]    UPDATE_CATEGORIES
    ${id}    Create category without description
    Update category description    ${id}
    Verify category was updated    ${body_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid meta string
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_wrong_meta_string}
    Verify response returns an error message    ${error_invalid_meta}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid meta number
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_wrong_meta_number}
    Verify response returns an error message    ${error_invalid_meta}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid parent list
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_wrong_parent_list}
    Verify response returns an error message    ${error_invalid_parent}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid parent dict
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_wrong_parent_dict}
    Verify response returns an error message    ${error_invalid_parent}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description int
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_description_int}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description list
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_description_list}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description dictionary
    [Tags]    UPDATE_CATEGORIES
    Update category with invalid parameter    ${body_edit_description_dict}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible create a category and edit it with inexistent parent
    [Tags]    UPDATE_CATEGORIES
    Delete Category    ${id}
    Set body with inexistent parent for edit    ${id}
    ${id_for_update}    Obtain existent category
    Update category with inexistent parent    ${id_for_update}
    Verify response returns an error message    ${error_parent_does_not_exist}
    Append To List    ${for_delete}    ${id_for_update}

Verify is not possible edit a category parent with its own id
    [Tags]    UPDATE_CATEGORIES
    Edit Category with its own id as parent
    Verify parent is set automaticly as zero
    Append To List    ${for_delete}    ${id}

Verify it is not possible edit a category with a slug that already exist
    [Tags]    UPDATE_CATEGORIES
    Obtain existent slug
    Edit category with existent slug
    Verify response returns an error message    ${error_slug_exist}

*** Keywords ***
Setup Test Case
    Create New Session
    ${id}    Obtain existent category
    ${for_delete}    set variable    ${empty_list}
    set test variable    ${id}
    set test variable    ${for_delete}

Delete Categories
    ${length}    get length    ${for_delete}
    IF    '${length}' != '${0}'
        ${url}    get_url    endpoint=${endpoint}
        ${params}    create dictionary    force=${1}
        delete_elements_from_list    ${for_delete}    ${url}    ${session}    ${params}
        FOR  ${item}  IN  @{for_delete}
            remove values from list    ${for_delete}  ${item}
        END
    END

Create category without description
    ${id}    ${category}    Create Category    ${body_name}
    [Return]    ${id}

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

Update category description
    [Arguments]    ${id}
    Update Category    ${id}    ${body_description}
    ${category}    Get Category    ${id}    200
    set test variable    ${category}

Update category with invalid parameter
    [Arguments]    ${body_edit_wrong_data}
    ${response}    Update Category With Error    ${id}    ${body_edit_wrong_data}    400
    set test variable    ${response}

Update category with inexistent parent
    [Arguments]    ${id_for_update}
    ${response}    Update Category With Error    ${id_for_update}    ${body_inexistent_parent}    400
    set test variable    ${response}

Set body with inexistent parent for edit
    [Arguments]    ${id_inexistent_parent}
    ${body_inexistent_parent}    create dictionary    parent=${id_inexistent_parent}
    set test variable    ${body_inexistent_parent}

Edit Category with its own id as parent
    ${body_edit}    create dictionary    parent=${id}
    ${category_updated}    Update Category    ${id}    ${body_edit}
    set test variable    ${category_updated}

Verify parent is set automaticly as zero
    ${new_parent}    get_key_value    ${category_updated}    parent
    Verify_Equal_Ignore    ${0}    ${new_parent}

Obtain existent slug
    ${body}    Get Category    ${id}    200
    ${slug}    get_key_value    ${body}    slug
    ${body_edit_slug}    create dictionary    slug=${slug}
    Append To List    ${for_delete}    ${id}
    set test variable    ${body_edit_slug}

Edit category with existent slug
    ${body_create}    create_body_category
    ${id}    ${response_create}    Create Category    ${body_create}
    ${response}    Update Category With Error    ${id}    ${body_edit_slug}    500
    Append To List    ${for_delete}    ${id}
    set test variable    ${response}

Verify category was updated
    [Arguments]    ${body}
    Verify_Subset_Ignore    ${category}    ${body}
