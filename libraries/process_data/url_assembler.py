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


from dotenv import load_dotenv
load_dotenv()


class UrlAssembler:

    def get_url(self, base_url, end_point, **kwargs):
        url = '%s/%s' % (base_url, end_point)
        for extra_path in kwargs:
            extra_path_value = kwargs.get(extra_path)
            url = '%s/%s' % (url, extra_path_value)
        return url
    