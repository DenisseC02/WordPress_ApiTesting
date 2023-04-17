import json
from robot.api import logger
from assertpy import soft_assertions
from assertpy import assert_that


class Verification(object):
    """Verifies the data"""

    def test_assertions(self, expected_result, actual_result):
        """Verifies actual result with the json schema"""
        with soft_assertions():
            with open(expected_result, 'r') as schema:
                schema = json.load(schema)
            logger.info("*****Expected******")
            logger.info(schema)
            logger.info("*****Actual******")
            logger.info(actual_result)
            assert_that(actual_result).is_equal_to(schema)
