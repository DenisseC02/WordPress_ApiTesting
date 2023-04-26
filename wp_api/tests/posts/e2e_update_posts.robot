*** Settings ***
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Resource    ../../keywords/posts/crud.robot
Variables       wp_api/resources/data/bodies/posts.py
Suite Setup      Create Session and params
Suite Teardown    Delete Posts Created
Force Tags    POSTS    POSTS_UPDATE

*** Variables ***
${bad_status}    400

*** Test Cases ***
Verify that a user can successfully publish a draft post
    Create new post    ${body_tb87_post}
    Update the post    ${body_tb87_put}

Verify that a public post can be saved as a draft
    Create new post     ${body_tb88_post}
    Update the post     ${body_tb88_put}

Verify that a user can successfully publish a post with ping status closed
    Create new post     ${body_tb88a_post}
    Update the post     ${body_tb88a_put}

Verify that a post with closed comment status can be updated to an open status
    Create new post    ${body_tb90_post}
    Update the post   ${body_tb90_put}

Verify that a post with closed ping_status can be updated to an open status
    Create new post    ${body_tb91a_post}
    Update the post   ${body_tb91a_put}

Verify that a new post can be created and updated with a slug
    Create new post   ${body_tb91_post}
    Update the post    ${body_tb91_slug}

Verify that a post cannot be edited with an invalid tag
    [Tags]    errors
    Create new post     ${body_tb95_post}
    Update the post with wrong values     ${body_tb95_put}       ${bad_status}

Verify that a post cannot be edited with an invalid status
    [Tags]    errors
    Create new post     ${body_tb96_post}
    Update the post with wrong values     ${body_tb96_put}       ${bad_status}

Verify that a post cannot be edited with an invalid comment status
    [Tags]    errors
    Create new post     ${body_tb97_post}
    Update the post with wrong values     ${body_tb97_put}       ${bad_status}
