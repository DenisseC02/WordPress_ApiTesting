*** Settings ***
Resource        wp_api/keywords/posts/ini.robot
Resource        wp_api/keywords/posts/crud.robot
Test Setup      Create Session and params
Test Teardown   Delete Created Pages
Variables       wp_api/resources/data/pages/posts.py

*** Test Cases ***
Verify the posts can be created and published
    Create new post     ${body_tb86_post}
