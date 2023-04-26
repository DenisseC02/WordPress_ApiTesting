*** Settings ***
Resource        wp_api/keywords/posts/crud.robot
Resource        wp_api/keywords/posts/update.robot
Resource    ../../keywords/posts/crud.robot
Variables       wp_api/resources/data/bodies/posts.py
Suite Setup      Create Session and params
Suite Teardown    Delete Posts Created
Force Tags    POSTS    POSTS_GET

*** Variables ***
${end_point_posts}      posts

*** Test Cases ***
Verify that public posts can be listed
    Create 3 valid posts    ${body_tb86_post}    ${body_tb87_put}    ${body_tb88_post}
    Verify that the pages was listed    ${status_public}

Verify that draft posts can be listed
    Create 3 valid posts    ${body_tb87_post}    ${body_tb88_put}    ${body_tb88a_post}
    Verify that the pages was listed    ${status_draft}

Verify that pending posts can be listed
    Create 3 valid posts    ${body_pending1}    ${body_pending2}    ${body_pending3}
    Verify that the pages was listed    ${status_pending}

Verify that private posts can be listed
    Create 3 valid posts    ${body_private1}    ${body_private2}    ${body_private3}
    Verify that the pages was listed    ${status_private}

*** Keywords ***
Create 3 valid posts
    [Arguments]    ${body1}    ${body2}    ${body3}
    Create new post    ${body1}
    Create new post    ${body2}
    Create new post    ${body3}

Verify that the pages was listed
    [Arguments]    ${status}
    ${url}    get_url    end_point=${end_point_posts}
    Log    ${url}
    ${response}    custom_get    ${session}    ${url}    status=${status}
    verify_posts_status    ${response}    ${status}
