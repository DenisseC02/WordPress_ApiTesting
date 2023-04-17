 #
 #  @oauth2.py Copyright (c) 2023 Jalasoft.                                    #
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


class OAuth2(Authorization): 
    """Creates a session using OAuth 2.0"""

    def authentication(self, server, client_id, client_secret, **kwargs):
        """TO DO"""
        params={}
        session = requests.Session()
        return session, params
