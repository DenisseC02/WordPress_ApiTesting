*** Settings ***
Variables    wp_api/resources/data/bodies/users.py
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    wp_api/resources/imports.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Resource    wp_api/keywords/categories/common_keywords.robot
Test Setup    Setup Test User and Categories
Test Teardown    Teardown Testcase
Force Tags    INTEGRATION    USERS    CATEGORIES    USERS_CATEGORIES    DELETE

*** Test Cases ***
Verify an administrator user can delete a category
    [Tags]    ADMINISTRATOR_ROLE
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Delete existent category
    Verify category was deleted
    Category Was Created    ${False}

Verify an editor user can delete a category
    [Tags]    EDITOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category
    Verify category was deleted
    Category Was Created    ${False}

Verify a subscriber user can not delete a category
    [Tags]    SUBSCRIBER_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}

Verify a contributor user can not delete a category
    [Tags]    CONTRIBUTOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}

Verify an author user can not delete a category
    [Tags]    AUTHOR_ROLE
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}

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
