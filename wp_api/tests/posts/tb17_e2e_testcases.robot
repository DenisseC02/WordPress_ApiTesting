*** Settings ***
Resource        wp_api/keywords/posts/ini.robot
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Test Setup      Create Session and params
Variables       wp_api/resources/data/bodies/posts.py

*** Variables ***
${bad_status}    410
${bad_status1}    400

*** Test Cases ***
Verify the posts can be created and published
    [Tags]    smoke
    Create new post     ${body_tb86_post}

Verify the post can be saved as a draft
    [Tags]    smoke
    Create new post    ${body_tb87_post}
    Update the post    ${body_tb87_put}

Verify that a user can successfully publish a draft post
    [Tags]    smoke
    Create new post     ${body_tb88_post}
    Update the post     ${body_tb88_put}

Verify that a user can successfully publish a post with ping status closed
    [Tags]    smoke
    Create new post     ${body_tb88a_post}
    Update the post     ${body_tb88a_put}

Verify that a post with closed comment status can be updated to an open status
    [Tags]    smoke
    Create new post    ${body_tb90_post}
    Update the post   ${body_tb90_put}

Verify that a post with closed ping_status can be updated to an open status
    [Tags]    smoke
    Create new post    ${body_tb91a_post}
    Update the post   ${body_tb91a_put}

Verify that a new post can be created and updated with a slug
    [Tags]    smoke
    Create new post   ${body_tb91_post}
    Update the post    ${body_tb91_slug}

Verify that a published post can be deleted
    [Tags]    smoke
    Create new post    ${body_tb98_post}
    Delete the post

Verify that a draft post can be deleted
    [Tags]    smoke
    Create new post        ${body_tb99_post}
    Delete the post

Verify that a post with closed comment status can be deleted
    [Tags]    smoke
    Create new post    ${body_tb100_post}
    Delete the post

Verify that a post cannot be edited with an invalid tag
    [Tags]    errors
    Create new post     ${body_tb95_post}
    Update the post with wrong values     ${body_tb95_put}       ${bad_status1}

Verify that a post cannot be edited with an invalid status
    [Tags]    errors
    Create new post     ${body_tb96_post}
    Update the post with wrong values     ${body_tb96_put}       ${bad_status1}

Verify that a post cannot be edited with an invalid comment status
    [Tags]    errors
    Create new post     ${body_tb97_post}
    Update the post with wrong values     ${body_tb97_put}       ${bad_status1}
