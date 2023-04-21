*** Settings ***
Variables   config/config.py
Variables    data/bodies/category.py
Library  libraries.process_data.url_assembler.UrlAssembler
Library    libraries.process_data.process_data.ProcessData
Library     libraries.requests.custom_request.CustomRequest
Library     libraries.authentication.custom_session.CustomSession
Library    libraries.assertions.verification.Verification
Library    libraries.utils.name_generator.NameGenerator
