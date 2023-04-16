 #
 #  @custom_request.py Copyright (c) 2023 Jalasoft.                            #
 #  2643 Av Melchor Perez de Olguin, Colquiri Sud, Cochabamba, Bolivia.        #
 #                                                                             #
 #  All rights reserved.                                                       #
 #                                                                             #
 #  This software is the confidential and proprietary information of           #
 #  Jalasoft, ('Confidential Information'). You shall not                      #
 #  disclose such Confidential Information and shall use it only in            #
 #  accordance with the terms of the license agreement you entered into        #
 #  with Jalasoft.                                                             #
 #


from libraries.authentication.basic import Basic
from libraries.requests.wp_request import MakeRequest
from libraries.process_data.url_assembler import UrlAssembler
from libraries.process_data.parser_data import ParserData


class CustomRequest:
    """"""
    def custom_get(self, session, url, params, expected_status=200, response_type=0):
        response = MakeRequest(session, url, params).method_get(expected_status=expected_status)
        # result = ParserData(response, response_type).method()
        result = response.json()
        return result
    
    def custom_post(self, session, url, params, body, expected_status=200):
        response = MakeRequest(session, url, params).method_post(body, expected_status)
        result = response.json()
        return result
    
    def custom_put(self, session, url, params, body, expected_status=200):
        response = MakeRequest(session, url, params).method_put(body, expected_status)
        result = response.json()
        return result
    
    def custom_delete(self, session, url, params, expected_status=200):
        response = MakeRequest(session, url, params).method_delete(expected_status=expected_status)
        result = response.json()
        return result
    

    # url = UrlAssembler().get_url( base_url=base_url, end_point=end_point, id=id)
    #     print(url)
    #     session, params = Basic().authentication(user=user, password=password)