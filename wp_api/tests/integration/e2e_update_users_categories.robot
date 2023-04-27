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
Force Tags    INTEGRATION    USERS    CATEGORIES    USERS_CATEGORIES    UPDATE

*** Test Cases ***
Verify an administrator user can update a category with valid params
    [Tags]    ADMINISTRATOR_ROLE
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Update existent category

Verify an editor user can update a category with valid params
    [Tags]    EDITOR_ROLE
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Update existent category

Verify a subscriber user can not update a category with valid params
    [Tags]    SUBSCRIBER_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

Verify a contributor user can not update a category with valid params
    [Tags]    CONTRIBUTOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

Verify an author user can not update a category with valid params
    [Tags]    AUTHOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

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
