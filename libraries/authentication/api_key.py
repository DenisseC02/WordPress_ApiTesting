 #
 #  @api_key.py Copyright (c) 2023 Jalasoft.                                   #
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


import requests
from libraries.authentication.authorization import Authorization


class Api_Key(Authorization):
    """Generates users valid API key"""
    
    def authentication(self, key, token, add_to) -> tuple:
        """Returns session authorization using API key method""" 
        params = {'key': key, 'token': token}
        session = requests.Session()
        return session, params
