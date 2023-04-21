*** Settings ***
Resource    ../../resources/imports.robot
Variables    ../../resources/data/bodies/pages.py

*** Variables ***
${end_point_pages}    pages

*** Keywords ***
Update the page with wrong values
    [Arguments]    ${body}    ${status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}    ${status}
    verify_subset    ${code}    ${response}
    