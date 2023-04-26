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
Force Tags    SMOKE    INTEGRATION    USERS    CATEGORIES    USERS_CATEGORIES    GET

*** Test Cases ***
Verify an administrator user can list a category
    [Tags]    ADMINISTRATOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Get Category With Valid User
    Verify if category is correct

Verify an editor user can list a category
    [Tags]    EDITOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Get Category With Valid User
    Verify if category is correct

Verify a subscriber user can list a category
    [Tags]    SUBSCRIBER_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Get Category With Valid User
    Verify if category is correct

Verify a contributor user can not list a category
    [Tags]    SUBSCRIBER_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Get Category With Valid User
    Verify if category is correct

Verify an author user can not list a category
    [Tags]    AUTHOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Get Category With Valid User
    Verify if category is correct

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
