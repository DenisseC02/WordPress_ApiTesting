*** Settings ***
Resource        wp_api/keywords/posts/ini.robot
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Test Setup      Create Session and params
Variables       wp_api/resources/data/pages/posts.py

*** Variables ***
${bad_status}    400

*** Test Cases ***
Verify that a user cannot be edited a post without a title
    Create new post        ${body_tb89_post}
    Update the post with wrong values     ${body_tb89_put}       ${bad_status}
