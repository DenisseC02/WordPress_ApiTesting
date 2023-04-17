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
    """Evaluates response and returns result on demand"""

    def __init__(self, response, response_type):
        self.response = response
        self.response_type = response_type

    def parser_by(self):
        """Calls the appropiated method acording the required result"""
        response_types = {
            'json': self._parser_json,
            'key': self._key
        }
        method_to_implement = response_types[self.response_type]
        parser = method_to_implement()
        return parser

    def _key(self, key):
        """Returns the value of requested key"""
        data = json.loads(self.response)
        return data[key]

    def _parser_json(self):
        """Returns result as json"""
        result = self.response.json()
        return result
