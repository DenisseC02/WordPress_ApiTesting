*** Settings ***
Resource    ../../resources/imports.robot

*** Variables ***
${end_point_posts}    posts

*** Keywords ***
Update the post with wrong values
    [Arguments]    ${body}    ${status}
    ${url}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${body}    ${body}    ${status}
    verify_subset    ${code}    ${response}
