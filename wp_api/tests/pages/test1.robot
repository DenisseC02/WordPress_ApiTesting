*** Settings ***
Library  libraries.requests.custom_request.CustomRequest
Library  libraries.authentication.basic.Basic
Library  libraries.process_data.url_assembler.UrlAssembler
Library    ../../../venv/lib/site-packages/robot/libraries/Process.py
  
*** Variables ***
${user}    telmarf
${password}    Pasuconsumo
${base_url}    http://localhost
${end_point}    wp-json/wp/v2/pages
${id}    ?_fields=id 
${result}

*** Test Cases ***
Verify get
    ${url}    get url    ${base_url}    ${end_point}    id=${id}
    ${session}  ${params}  authentication   ${user}    ${password} 
    ${response}    custom get    ${session}    ${url}    ${params}
    Log To Console    ${response}


# url = UrlAssembler().get_url( base_url=base_url, end_point=end_point, id=id)
    #     print(url)
    #     session, params = Basic().authentication(user=user, password=password)