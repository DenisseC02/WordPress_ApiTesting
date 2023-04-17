 #
 #  @bearer.py Copyright (c) 2023 Jalasoft.                                    #
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


class Bearer(Authorization):
    """Authorization using bearer token method"""

    def authentication(self, token) -> tuple:
        """Returns session authorization using bearer token method"""
        params = {}
        session = requests.Session()
        session.headers.update({'Authorization': 'Bearer ' + token})
        return session, params
