*** Settings ***
Resource    ../../keywords/pages/run.robot
Resource    ../../keywords/pages/crud.robot
Test Setup    Create Session and params
Variables    ../../resources/data/bodies/pages.py

*** Test Cases ***
Verify that a page with closed comment status can be deleted
    Create new page    ${body_test6_post}  
    Delete the page
