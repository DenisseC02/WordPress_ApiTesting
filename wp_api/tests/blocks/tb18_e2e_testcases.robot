*** Settings ***
Variables      wp_api/resources/data/bodies/blocks.py
Resource       wp_api/keywords/blocks/crud_blocks.robot
Resource       wp_api/keywords/blocks/errors_blocks.robot

Test Setup       Setup Testcase
Test Teardown    Teardown Testcase

*** Variables ***
${end_point}    blocks

*** Test Cases ***
Verify that a Block is created successfully with valid parameters
    [Tags]     smoke
    Create 1 Valid Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Private Block is created successfully
    [Tags]     smoke
    Create 1 Private Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Draft Block is created successfully
    [Tags]     smoke
    Create 1 Draft Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created
Verify that a Pending Block is created successfully
    [Tags]     smoke
    Create 1 Pending Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify that a Future Block is created successfully
    [Tags]     smoke
    Create 1 Future Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created
    
Verify that blocks is created without paramameters
    [Tags]     smoke
    Create 1 Empty Blocks
    Get Blocks List
    List Should Contain the 1 Blocks Created

Verify blocks are not created with wrong status
    [Tags]     errors
    Create Block with "invalid status"
    Get Blocks List
    List Should Contain the 0 Blocks Created

Verify blocks are not created with wrong date
    [Tags]     errors
    Create Block with "invalid date"
    Get Blocks List
    List Should Contain the 0 Blocks Created

Verify blocks are not created with wrong date_gmt
    [Tags]     errors
    Create Block with "invalid date_gmt"
    Get Blocks List
    List Should Contain the 0 Blocks Created

Verify blocks are not created with wrong name
    [Tags]    errors
    log    to do

Verify that a draft block can be deleted.
    [Tags]    bugs    smoke
    Create 1 draft Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created    
Verify that a publish block can be deleted
    [Tags]    smoke
    Create 1 valid Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a furure block can be deleted
    [Tags]    smoke
    Create 1 future Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created
Verify that a pending block can be deleted
    [Tags]    bugs    smoke
    Create 1 pending Blocks
    Delete block ${id}
    Get Blocks List    
    List Should Contain the 0 Blocks Created

Verify that a private block can be deleted
    [Tags]    bugs    smoke
    Create 1 private Blocks
    Get Blocks List    
    Delete block ${id}
    List Should Contain the 0 Blocks Created

Verify list of available blocks
    [Tags]    smoke
    Create 3 Valid Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created

Verify draft blocks are not listed by default
    [Tags]    smoke
    Create 3 Valid Blocks
    Create 2 Draft Blocks
    Get list of block ids
    List Should Contain the 3 Blocks Created

Verify Private blocks are not listed by default
    [Tags]    errors
    Create 4 Valid Blocks
    Create 1 Private Blocks
    Get list of block ids
    List Should Contain the 4 Blocks Created

Verify Pending blocks are not listed by default
    [Tags]    errors
    Create 2 Valid Blocks
    Create 1 Pending Blocks
    Get list of block ids
    List Should Contain the 2 Blocks Created

Verify Future blocks are listed by default
    [Tags]    smoke
    Create 1 Valid Blocks
    Create 5 Future Blocks
    Get list of block ids
    List Should Contain the 6 Blocks Created

Verify that the status of the block can be edited.
    [Tags]    smoke
    Create 1 Valid Blocks
    Update The Status Of The Block
    Get Blocks List
    Verify That The status Is Updated

Verify that the slug of the block can be edited.
    [Tags]    smoke
    Create 1 Valid Blocks
    Update The slug Of The Block
    Get Blocks List
    Verify That The slug Is Updated

Verify that the date of the block can be edited.
    [Tags]    smoke
    Create 1 Valid Blocks
    Update The date Of The Block
    Get Blocks List
    Verify That The date Is Updated

Verify that the list of blocks is returned filtered by ids.
    [Tags]    smoke
    Create Block    ${body_create}    
    Read all Blocks    ${extraurl}

*** Keywords ***
Setup Testcase
    Create Session And Authentication
    Get Blocks List
    Delete All The Blocks Created

Teardown Testcase
    Get Blocks List
    Delete All The Blocks Created
