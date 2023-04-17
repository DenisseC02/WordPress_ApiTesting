 #
 #  @verification.py Copyright (c) 2023 Jalasoft.                              #
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
from robot.api import logger
from assertpy import soft_assertions
from assertpy import assert_that


class Verification(object):
    """A Verification class """
    def test_assertions(self, expected_result, actual_result):
        """Asserts that the expected result is equal to the expected_result """
        with soft_assertions():
            with open(expected_result, 'r') as schema:
                schema = json.load(schema)
            logger.info("*****Expected******")
            logger.info(schema)
            logger.info("*****Actual******")
            logger.info(actual_result)
            assert_that(actual_result).is_equal_to(schema)
