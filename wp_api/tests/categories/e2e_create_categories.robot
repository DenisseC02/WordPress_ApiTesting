*** Settings ***
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Setup Test Case
Test Teardown    Delete Categories
Force Tags    CATEGORIES    CATEGORIES_CREATE

*** Variables ***
${body_name}=    ${body_just_name}
${body_description}=    ${body_just_description}
${endpoint}=    categories

*** Test Cases ***
Create a category and verify it exist on list of categories
    Create category for search
    Verify created category exists on list of categories
    Append To List    ${for_delete}    ${id}

Verify is not possible create a category without name
    [Tags]    ERRORS
    Create category without name
    Verify response returns an error message    ${error_missing_name}

Verify is not possble Create Two Categories With The Same Name And Parent
    [Tags]    ERRORS
    Set body to create categories with same parent and name
    Create two categories with the same name and parent
    Verify response returns an error message    ${error_term_exist}
    Append To List    ${for_delete}    ${id}

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

Create category for search
    ${body_create}    create_body_category
    ${id}    ${new_category}    Create Category    ${body_create}
    ${category_was_created}    set variable    ${True}
    set test variable    ${id}
    set test variable    ${new_category}

Create category without name
    ${response}    Create Category With Error    ${body_just_description}    ${error_missing_name}
    set test variable    ${response}

Verify created category exists on list of categories
    ${all_categories}    Get all Categories
    ${category}    search_element_in_list    id    ${id}    ${all_categories}
    verify_equal_ignore    ${category}    ${new_category}

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
