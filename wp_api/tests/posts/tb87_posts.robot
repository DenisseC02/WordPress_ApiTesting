*** Settings ***
Resource        wp_api/keywords/posts/ini.robot
Resource        wp_api/keywords/posts/crud.robot
Test Setup      Create Session and params
Variables       wp_api/resources/data/bodies/posts.py

*** Test Cases ***
Verify that a user can successfully publish a draft post
    Create new post     ${body_tb87_post}
    Update the post     ${body_tb87_put}
    Delete The Post
