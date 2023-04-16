 #
 #  @parser_data.py Copyright (c) 2023 Jalasoft.                               #
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


import json


class ParserData(object):
    
    def __init__(self, response, response_type) -> None:
        self.response = response
        self.response_type = response_type

    def _key(response, key):
        data = json.loads(response)
        return data[key]

    def _parser_json(self):
        result = self.response.json()
        return result
    