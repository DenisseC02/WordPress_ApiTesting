*** Settings ***
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Resource    ../../keywords/posts/crud.robot
Variables       wp_api/resources/data/bodies/posts.py
Test Setup      Create Session and params
Force Tags    SMOKE    POSTS    POSTS_CRUD

*** Variables ***
${end_point_posts}      posts

*** Test Cases ***
Verify is posible create, edit, list and delete a post
    Create new post    ${body_tb86_post}
    Update the post    ${body_tb91_post}
    Retrieve the post    200
    Delete the post
