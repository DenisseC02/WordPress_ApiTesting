*** Settings ***
Variables    wp_api/resources/data/bodies/users.py
Variables    wp_api/resources/data/bodies/category.py
Library    wp_api.resources.data.bodies.category_body_generator.CategoryBodyGenerator
Resource    wp_api/resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test
Test Teardown    Teardown Testcase

*** Keywords ***

*** Test Cases ***
Verify an administrator user can create a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create valid category
    Verify if category was created succefully

Verify an editor can create a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create valid category
    Verify if category was created succefully

Verify a subscriber user can not create a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    [Teardown]    Teardown Testcase without category

Verify a contributor user can not create a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    [Teardown]    Teardown Testcase without category

Verify an author user can not create a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create category with invalid user
    Verify response returns an error message    ${error_user_create}
    [Teardown]    Teardown Testcase without category

Verify an administrator user can update a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Update existent category

Verify an editor user can update a category with valid params
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Update existent category

Verify a subscriber user can not update a category with valid params
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

Verify a contributor user can not update a category with valid params
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

Verify an author user can not update a category with valid params
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Update existent category with invalid user
    Verify response returns an error message    ${error_user_update}

Verify an administrator user can delete a category
    [Tags]    smoke    categories
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Obtain existent category
    Delete existent category
    Verify category was deleted
    [Teardown]    Teardown Testcase without category

Verify an editor user can delete a category
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category
    Verify category was deleted
    [Teardown]    Teardown Testcase without category

Verify a subscriber user can not delete a category
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with subscriber role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}
    [Teardown]    Teardown Testcase without category

Verify a contributor user can not delete a category
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with contributor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}
    [Teardown]    Teardown Testcase without category

Verify an author user can not delete a category
    [Tags]    smoke    categories
    Obtain existent category
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Delete existent category with invalid user
    Verify response returns an error message    ${error_user_delete}
    [Teardown]    Teardown Testcase without category

*** Keywords ***
Create valid category
    ${body}    create_body_category
    ${category_id}    ${category}    Create Category    ${body}
    set suite variable    ${category_id}
    set suite variable    ${category}

Create category with invalid user
    ${body}    create_body_category
    ${response}    create category with error    ${body}    ${error_user_create}    403
    set suite variable    ${response}

Verify if category was created succefully
    ${response_get}    Get Category    ${category_id}
    verify_equal_ignore    ${response_get}    ${category}

Teardown Testcase
    Delete Created User    ${admin_session}   ${response_user}
    Delete Category    ${category_id}    ${admin_session}

Teardown Testcase without category
    Delete Created User    ${admin_session}   ${response_user}

Obtain existent category
    Create valid category

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
