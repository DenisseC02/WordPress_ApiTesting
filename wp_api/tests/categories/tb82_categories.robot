*** Settings ***
Resource    ../../resources/imports.robot
Resource    ../../keywords/categories/categories_crud.robot
Resource    ../../keywords/categories/categories_crud_with_errors.robot
Test Setup    Create New Session

*** Test Cases ***
Create a category and edit with invalid meta string
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_wrong_meta_string}    400
    Verify_Equal_Ignore    ${error_invalid_meta}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid meta number
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_wrong_meta_number}    400
    Verify_Equal_Ignore    ${error_invalid_meta}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid parent list
    Create Category    ${body_complete}
    log     ${body_edit_wrong_parent_list}
    Log     ${ID}
    Update Category With Error    ${ID}    ${body_edit_wrong_parent_list}    400
    Verify_Equal_Ignore    ${error_invalid_parent}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid parent dict
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_wrong_parent_dict}    400
    Verify_Equal_Ignore    ${error_invalid_parent}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid description int
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_description_int}    400
    Verify_Equal_Ignore    ${error_invalid_description}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid description list
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_description_list}    400
    Verify_Equal_Ignore    ${error_invalid_description}    ${response_put}
    Delete Category    ${ID}

Create a category and edit with invalid description dictionary
    Create Category    ${body_complete}
    Update Category With Error    ${ID}    ${body_edit_description_dict}    400
    Verify_Equal_Ignore    ${error_invalid_description}    ${response_put}
    Delete Category    ${ID}
