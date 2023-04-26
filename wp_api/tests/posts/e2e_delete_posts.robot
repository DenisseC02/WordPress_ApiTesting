*** Settings ***
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Resource    ../../keywords/posts/crud.robot
Variables       wp_api/resources/data/bodies/posts.py
Test Setup      Create Session and params
Force Tags    POSTS    POSTS_DELETE

*** Test Cases ***
Verify that a published post can be deleted
    Create new post    ${body_tb98_post}
    Delete the post

Verify that a draft post can be deleted
    Create new post        ${body_draft}
    Delete the post

Verify that a private post can be deleted
    Create new post        ${body_private}
    Delete the post

Verify that a pending post can be deleted
    Create new post        ${body_pending}
    Delete the post

Verify that a future post can be deleted
    Create new post        ${body_future}
    Delete the post

Verify that a post with closed comment status can be deleted
    Create new post    ${body_tb100_post}
    Delete the post

Verify that a post with open comment status can be deleted
    Create new post    ${body_tb11_post}
    Delete the post
