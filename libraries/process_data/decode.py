 #
 #  @decode.py Copyright (c) 2023 Jalasoft.                                    #
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


class Decode(object):
    """Decodes end point response"""

    @staticmethod
    def decode_response(response):
        """Returns decoded response"""
        decoded_result = response.content.decode('utf-8')
        return decoded_result
