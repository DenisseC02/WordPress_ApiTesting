import json
import jsonschema
from robot.api import logger
from assertpy import soft_assertions
from assertpy import assert_that

class PagesVerification:
    """Assertions for pages"""
    def verify_same_parent(self, actual_result, expected_result):
        """Asserts that a list of pages have the same parent"""
        with soft_assertions():
            logger.info("*****Expected******")
            logger.info(expected_result)
            logger.info("*****Actual******")
            logger.info(actual_result)
            logger.info(type(expected_result))
            logger.info(type(actual_result))
            for page in actual_result:
                assert_that(page["parent"]).is_equal_to(int(expected_result))
