*** Settings ***
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Resource    ../../keywords/posts/crud.robot
Variables       wp_api/resources/data/bodies/posts.py
Suite Setup      Create Session and params
Suite Teardown    Delete Posts Created
Force Tags    POSTS    POSTS_CREATE

*** Variables ***
${bad_status}    400
${end_point_posts}      posts

*** Test Cases ***
Verify the Post can be created and published
    Create new post     ${body_tb86_post}
    Retrieve the post    200

Verify that a Post cannot be created withouth parameters
    [Tags]    errors
    Create new post withouth parameters    ${body_tb89_post}    ${bad_status}
    Verify that the post was not create

Verify that a Private Post is created successfully
    Create new post     ${body_private}
    Retrieve the post    200

Verify that a Draft Post is created successfully
    Create new post     ${body_draft}
    Retrieve the post    200

Verify that a Pending Post is created successfully
    Create new post     ${body_pending}
    Retrieve the post    200

Verify that a Future Post is created successfully
    Create new post     ${body_future}
    Retrieve the post    200
    
*** Keywords ***
Create new post withouth parameters
    [Arguments]    ${body}    ${status}
    ${url}   get_url    posts=${end_point_posts}
    Log     ${url}
    ${response}  custom_post   ${session}   ${url}     ${params}     ${body}     ${status}
    Set Test Variable    ${response}

Verify that the post was not create
    verify_subset    ${message_response}    ${response}
