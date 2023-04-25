*** Settings ***
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library     libraries.process_data.url_assembler.UrlAssembler
Variables   wp_api/resources/data/bodies/users.py
Variables   wp_api/resources/data/bodies/blocks.py
Resource    wp_api/keywords/blocks/crud_blocks.robot
Resource    wp_api/keywords/users/keywords.robot
Resource    wp_api/keywords/pages/crud.robot
Test Setup    Setup Test
Force Tags    compose
Test Teardown    Teardown Testcase

*** Test Cases ***
Verify that a Block is created with valid parameters with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created with valid parameters with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created with valid parameters with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created with valid parameters with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Valid Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created with valid parameters with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Valid Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

Verify that a Block is created as a draft with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Draft Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a draft with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Draft Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a draft with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Draft Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created as a draft with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Draft Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created as a draft with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Draft Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

Verify that a Block is created as a private with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Private Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a private with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Private Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a private with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Private Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created as a private with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Private Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created as a private with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Private Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

Verify that a Block is created as a pending with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Pending Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a pending with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Pending Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a pending with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Pending Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created as a pending with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Pending Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created as a pending with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Pending Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

Verify that a Block is created as a future with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Future Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a future with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Future Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a future with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Future Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created as a future with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Future Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created as a future with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Future Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

Verify that a Block is created as a empty with an administrator user
    [Tags]    smoke
    ${user}   ${password}   Create user with administrator role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a empty with an editor user
    [Tags]    smoke
    ${user}   ${password}   Create user with editor role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Block is created as a empty with an author user
    [Tags]    smoke
    ${user}   ${password}   Create user with author role and return credentials
    Create Custom Session And Params   ${user}    ${password}
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

#Verify that a Block is created as a empty with an contributor user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with contributor role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Empty Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created
#
#Verify that a Block is created as a empty with an subscriber user
#    [Tags]    smoke
#    ${user}   ${password}   Create user with subscriber role and return credentials
#    Create Custom Session And Params   ${user}    ${password}
#    Create 1 Empty Blocks
#    Get Blocks List
#    List Should Contain the 1 Blocks Created

*** Keywords ***
Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
    Delete Created User    ${admin_session}   ${response_user}
