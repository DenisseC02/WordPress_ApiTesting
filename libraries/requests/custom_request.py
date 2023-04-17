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


from libraries.requests.wp_request import MakeRequest
from libraries.process_data.parser_data import ParserData


class CustomRequest:
    """Performes customized request to the end point"""

    def custom_get(self, session, url, params, expected_status=200, 
                   response_type='json'):
        """Custom get request"""
        make_request = MakeRequest(session, url, params)
        response = make_request.method_get(expected_status)
        result = ParserData(response, response_type).parser_by()
        return result
    
    def custom_post(self, session, url, params, body, expected_status=200, 
                    response_type='json'):
        """Custom post request"""
        make_request = MakeRequest(session, url, params)
        response = make_request.method_post(body, expected_status)
        result = ParserData(response, response_type).parser_by()
        return result
    
    def custom_put(self, session, url, params, body, expected_status=200,
                    response_type='json'):
        """Custom put request"""
        make_request = MakeRequest(session, url, params)
        response = make_request.method_put(body, expected_status)
        result = ParserData(response, response_type).parser_by()
        return result
    
    def custom_delete(self, session, url, params, expected_status=200, 
                      response_type='json'):
        """Custom delete request"""
        make_request = MakeRequest(session, url, params)
        response = make_request.method_delete(expected_status)
        result = ParserData(response, response_type).parser_by()
        return result
