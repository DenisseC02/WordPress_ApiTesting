*** Settings ***
Library  libraries.process_data.url_assembler.UrlAssembler
Library  libraries.requests.custom_request.CustomRequest
Library    libraries.assertions.verification.Verification
Variables     wp_api/resources/data/json/posts.py

*** Variables ***
${end_point_posts}    posts

*** Keywords ***
Update the post with wrong values
    [Arguments]    ${body}    ${status}
    ${url}    get_url    end_point=${end_point_posts}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${body}    ${body}    ${status}
    verify_subset    ${code}    ${response}
