 #
 #  @url_assembler.py Copyright (c) 2023 Jalasoft.                             #
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


from os import getenv


class UrlAssembler:
    """Assemble the end point URL"""

    def get_url(self, **kwargs):
        """Returns the URL"""
        base_url = getenv("HOST")
        end_point = getenv("END_POINT")
        port = getenv("PORT")
        url = '%s:%s/%s' % (base_url, port, end_point)
        for extra_path in kwargs:
            extra_path_value = kwargs.get(extra_path)
            url = '%s/%s' % (url, extra_path_value)
        return url
