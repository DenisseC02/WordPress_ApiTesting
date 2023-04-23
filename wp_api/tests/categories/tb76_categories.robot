*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session
#Test Teardown    Delete Category    ${ID}

*** Variables ***
${body_name}=    ${body_just_name}
${body_description}=    ${body_just_description}
${body_update}=    ${body_complete2}

*** Test Cases ***
Verify is posible edit and delete a category
    ${id}    Obtain existent category
    Update Category    ${id}    ${body_update}
    Delete Category    ${id}
    Log    Verify category was deleted:
    Get Category With error    ${id}    404

Create a category and verify it exist on list of categories
    ${id}   ${category}    Create category for search
    Verify created category exists on list of categories    ${id}    ${category}
    Delete Category    ${id}

Verify is not possible create a category without name
    ${response}    Create Category With Error    ${body_just_description}    ${error_missing_name}
    Verify response returns an error message    ${response}    ${error_missing_name}

Verify is not possble Create Two Categories With The Same Name And Parent
    ${parent_id}    Obtain parent category
    ${body_create}    Set body to create categories with same parent and name    ${parent_id}
    ${response}    Create two categories with the same name and parent    ${body_create}
    Verify response returns an error message    ${response}    ${error_term_exist}

Delete inexistent category
    ${id}    Obtain existent category
    Delete Category    ${id}
    Log    Delete inexistent cateogry
    Delete Category With Error    ${id}

Verify is possible create a category without description and add it with update
    ${id}    Create category without description
    ${category_updated}    Update category description    ${id}
    Log    verify category was updated:
    Verify_Subset_Ignore    ${category_updated}    ${body_description}

Verify is not possible edit a category with invalid meta string
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_wrong_meta_string}
    Log    Verify error message invalid meta parameter
    Verify_Equal_Ignore    ${error_invalid_meta}    ${error_message}

Verify is not possible edit a category with invalid meta number
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_wrong_meta_number}
    Log    Verify error message invalid meta parameter
    Verify_Equal_Ignore    ${error_invalid_meta}    ${error_message}

Verify is not possible edit a category with invalid parent list
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_wrong_parent_list}
    Log    Verify error message invalid parent parameter
    Verify_Equal_Ignore    ${error_invalid_parent}    ${error_message}

Verify is not possible edit a category with invalid parent dict
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_wrong_parent_dict}
    Log    Verify error message invalid parent parameter
    Verify_Equal_Ignore    ${error_invalid_parent}    ${error_message}

Verify is not possible edit a category with invalid description int
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_description_int}
    Log    Verify error message invalid description parameter
    Verify_Equal_Ignore    ${error_invalid_description}    ${error_message}

Verify is not possible edit a category with invalid description list
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_description_list}
    Log    Verify error message invalid description parameter
    Verify_Equal_Ignore    ${error_invalid_description}    ${error_message}

Verify is not possible edit a category with invalid description dictionary
    ${id}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id}    ${body_edit_description_dict}
    Log    Verify error message invalid description parameter
    Verify_Equal_Ignore    ${error_invalid_description}    ${error_message}

Verify is not possible create a category and edit it with inexistent parent
    ${id_parent}    Obtain inexistent category
    ${body_inexistent_parent}    Set body with inexistent parent for edit    ${id_parent}
    ${id_for_edit}    Obtain existent category
    ${error_message}    Update category with invalid parameter    ${id_for_edit}    ${body_inexistent_parent}
    Log    Verify error message parent does not exist
    Verify_Equal_Ignore    ${error_parent_does_not_exist}    ${error_message}

Verify is not possible edit a category parent with its own id
    ${id}    Obtain existent category
    ${category_updated}    Edit Category with its own id as parent    ${id}
    Verify parent is set automaticly as zero    ${category_updated}

Verify it is not possible edit a category with a slug that already exist
    ${body_edit_slug}    Obtain existent slug
    ${response}    Edit category with existent slug    ${body_edit_slug}
    Verify response returns an error message    ${response}    ${error_slug_exist}

*** Keywords ***
Create category for search
    ${id}    ${new_category}    Create Category    ${body_complete}
    [Return]    ${id}    ${new_category}

Verify created category exists on list of categories
    [Arguments]    ${id}    ${response_create}
    ${all_categories}    Get all Categories
    ${category}    search_element_in_list    id    ${id}    ${all_categories}
    verify_equal_ignore    ${category}    ${response_create}

Verify response returns an error message
    [Arguments]    ${response}    ${body_error}
    ${code_error}    get_key_value    ${body_error}    code
    ${code_error_from_response}    get_key_value    ${response}    code
    verify_equal_ignore    ${code_error}    ${code_error_from_response}

Obtain First Category
    ${all_categories}    Get all Categories
    ${category}    get_key_value    ${all_categories}    ${0}
    ${id}    get_key_value    ${category}    id
    [Return]    ${id}

Obtain existent category
    ${all_categories}    Get all Categories
    ${length}    get length    ${all_categories}
    IF    '${length}' == '${0}'
        ${id}    ${new_category}    Create Category    ${body_complete}
    ELSE
        ${id}    Obtain First Category
    END
    [Return]    ${id}

Obtain parent category
    ${id}    Obtain existent category
    [Return]    ${id}

Set body to create categories with same parent and name
    [Arguments]    ${parent_id}
    ${name}    generate name    category    ${5}
    ${body}    create dictionary    name=${name}    parent=${parent_id}
    [Return]    ${body}

Create two categories with the same name and parent
    [Arguments]    ${body_create}
    Create Category    ${body_create}
    ${response_error}    Create Category With Error    ${body_create}    ${error_term_exist}
    [Return]    ${response_error}

Create category without description
    ${id}    ${category}    Create Category    ${body_name}
    [Return]    ${id}

Update category description
    [Arguments]    ${id}
    Update Category    ${id}    ${body_description}
    ${category}    Get Category    ${id}    200
    [Return]    ${category}

Update category with invalid parameter
    [Arguments]    ${id}    ${body_edit_wrong_data}
    ${response_update}    Update Category With Error    ${id}    ${body_edit_wrong_data}    400
    [Return]    ${response_update}

Obtain inexistent category
    ${id}    Obtain existent category
    Delete Category    ${id}
    [Return]    ${id}

Set body with inexistent parent for edit
    [Arguments]    ${id}
    ${body}    create dictionary    parent=${id}
    [Return]    ${body}

Edit Category with its own id as parent
    [Arguments]    ${id}
    ${body_edit}    create dictionary    parent=${id}
    ${category_update}    Update Category    ${id}    ${body_edit}
    [Return]    ${category_update}

Verify parent is set automaticly as zero
    [Arguments]    ${category_updated}
    ${new_parent}    get_key_value    ${category_updated}    parent
    Verify_Equal_Ignore    ${0}    ${new_parent}

Obtain existent slug
    ${id}    Obtain existent category
    ${body}    Get Category    ${id}    200
    ${slug}    get_key_value    ${body}    slug
    ${body_for_edit_slug}    create dictionary    slug=${slug}
    [Return]    ${body_for_edit_slug}

Edit category with existent slug
    [Arguments]    ${body_edit}
    ${id}    ${response_create}    Create Category    ${body_complete}
    ${response_update}    Update Category With Error    ${id}    ${body_edit}    500
    [Return]    ${response_update}
