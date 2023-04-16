*** Settings ***
Variables    wp_api/resources/config/config.py
Library  libraries.requests.custom_request.CustomRequest
Library  libraries.authentication.custom_session.CustomSession
Library  libraries.process_data.url_assembler.UrlAssembler
  
*** Variables ***
${user}    telmarf
${password}    Pasuconsumo
${base_url}    http://localhost
${end_point_path}    media
${status}    401

*** Test Cases ***
Verify get
    ${url}    get url    
    Log To Console    ${url}
    ${session}  ${params}  create session    
    ${response}    custom get    ${session}    ${url}    ${params}
    Log To Console    ${response}


# url = UrlAssembler().get_url( base_url=base_url, end_point=end_point, id=id)
    #     print(url)
    #     session, params = Basic().authentication(user=user, password=password)