*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
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
Verify is posible edit and delete a category
    [Tags]    smoke
    Update existent category
    Delete Category    ${id}
    Log    Verify category was deleted:
    Get Category With error    ${id}    404

Create a category and verify it exist on list of categories
    [Tags]    smoke
    Create category for search
    Verify created category exists on list of categories
    Append To List    ${for_delete}    ${id}

Verify is not possible create a category without name
    [Tags]    errors
    Create category without name
    Verify response returns an error message    ${error_missing_name}
    Append To List    ${for_delete}    ${id}

Verify is not possble Create Two Categories With The Same Name And Parent
    [Tags]    errors
    Set body to create categories with same parent and name
    Create two categories with the same name and parent
    Verify response returns an error message    ${error_term_exist}
    Append To List    ${for_delete}    ${id}

Delete inexistent category
    [Tags]    errors
    Delete existent category
    Delete inexistent category

Verify is possible create a category without description and add it with update
    [Tags]    smoke
    ${id}    Create category without description
    Update category description    ${id}
    Verify category was updated    ${body_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid meta string
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_wrong_meta_string}
    Verify response returns an error message    ${error_invalid_meta}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid meta number
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_wrong_meta_number}
    Verify response returns an error message    ${error_invalid_meta}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid parent list
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_wrong_parent_list}
    Verify response returns an error message    ${error_invalid_parent}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid parent dict
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_wrong_parent_dict}
    Verify response returns an error message    ${error_invalid_parent}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description int
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_description_int}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description list
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_description_list}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible edit a category with invalid description dictionary
    [Tags]    errors
    Update category with invalid parameter    ${body_edit_description_dict}
    Verify response returns an error message    ${error_invalid_description}
    Append To List    ${for_delete}    ${id}

Verify is not possible create a category and edit it with inexistent parent
    [Tags]    errors
    Delete Category    ${id}
    Set body with inexistent parent for edit    ${id}
    ${id_for_update}    Obtain existent category
    Update category with inexistent parent    ${id_for_update}
    Verify response returns an error message    ${error_parent_does_not_exist}
    Append To List    ${for_delete}    ${id_for_update}

Verify is not possible edit a category parent with its own id
    [Tags]    smoke
    Edit Category with its own id as parent
    Verify parent is set automaticly as zero
    Append To List    ${for_delete}    ${id}

Verify it is not possible edit a category with a slug that already exist
    [Tags]    errors
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

Update existent category
    ${body_update}    create_body_category
    Update Category    ${id}    ${body_update}

Create category for search
    ${body_create}    create_body_category
    ${id}    ${new_category}    Create Category    ${body_create}
    ${category_was_created}    set variable    ${True}
    set test variable    ${id}
    set test variable    ${new_category}

Create category without name
    ${response}    Create Category With Error    ${body_just_description}    ${error_missing_name}
    set test variable    ${response}

Create category without description
    ${id}    ${category}    Create Category    ${body_name}
    [Return]    ${id}

Verify created category exists on list of categories
    ${all_categories}    Get all Categories
    ${category}    search_element_in_list    id    ${id}    ${all_categories}
    verify_equal_ignore    ${category}    ${new_category}

Verify response returns an error message
    [Arguments]    ${body_error}
    ${code_error}    get_key_value    ${body_error}    code
    ${code_error_from_response}    get_key_value    ${response}    code
    verify_equal_ignore    ${code_error}    ${code_error_from_response}

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

Set body to create categories with same parent and name
    ${name}    generate name    category    ${5}
    ${body_created}    create dictionary    name=${name}    parent=${id}
    set test variable    ${body_created}

Create two categories with the same name and parent
    ${id}    ${response}    Create Category    ${body_created}
    ${response}    Create Category With Error    ${body_created}    ${error_term_exist}
    Delete Category    ${id}
    set test variable    ${response}

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

Obtain inexistent category
    ${id}    Obtain existent category
    Delete Category    ${id}
    [Return]    ${id}

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

Delete existent category
    Delete Category    ${id}

Delete inexistent category
    Delete Category With Error    ${id}

Verify category was updated
    [Arguments]    ${body}
    Verify_Subset_Ignore    ${category}    ${body}
