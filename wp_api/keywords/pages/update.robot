*** Settings ***
Library  libraries.process_data.url_assembler.UrlAssembler
Library  libraries.requests.custom_request.CustomRequest
Library    libraries.assertions.verification.Verification
Variables    ../../resources/data/json/pages.py

*** Variables ***
${end_point_pages}    pages

*** Keywords ***
Update the page with wrong values
    [Arguments]    ${body}    ${status}
    ${url}    get_url    end_point=${end_point_pages}    id=${id}
    Log    ${url}
    ${response}    custom_put    ${session}    ${url}    ${params}    ${body}    ${status}
    verify_subset    ${code}    ${response}
    