*** Settings ***
Variables    wp_api/resources/data/bodies/users.py
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    wp_api/resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Resource    wp_api/keywords/categories/common_keywords.robot
Test Setup    Setup Test User and Categories
Test Teardown    Teardown Testcase
Force Tags    SMOKE    INTEGRATION    USERS    CATEGORIES    USERS_CATEGORIES    CREATE

*** Keywords ***

*** Test Cases ***
Verify an administrator user can create a category with valid params
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create valid category
    Verify if category was created succefully

Verify an editor can create a category with valid params
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create valid category
    Verify if category was created succefully

Verify a subscriber user can not create a category with valid params
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    Category Was Created    ${False}

Verify a contributor user can not create a category with valid params
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    Category Was Created    ${False}

Verify an author user can not create a category with valid params
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    Category Was Created    ${False}

*** Keywords ***
Setup Test User and Categories
    Setup test
    Category Was Created    ${True}


Category Was Created
    [Arguments]    ${boolean}
    Set Test Variable     ${category_was_created}    ${boolean}

Teardown Testcase
    Delete Created User    ${admin_session}   ${response_user}
    IF    '${category_was_created}'=='${True}'
        Delete Category    ${category_id}    ${admin_session}
    END
