import json
import jsonschema
from robot.api import logger
from assertpy import soft_assertions
from assertpy import assert_that


class Verification(object):
    """A Verification class"""

    def verify_schema(self, path_json_schema, response):
        """Asserts the response corresponds to the schema """
        with soft_assertions():
            with open(path_json_schema, 'r') as schema1:
                schema = json.load(schema1)
            logger.info("*****Expected******")
            logger.info(schema)
            logger.info("*****Actual******")
            logger.info(response)
            result_validation=jsonschema.validate(response, schema)
            assert result_validation is None
   
    def verify_subset(self, expected_result, actual_result):
        """Asserts the expected is subset of actual"""
        with soft_assertions():
            logger.info("*****Expected******")
            logger.info(expected_result)
            logger.info("*****Actual******")
            logger.info(actual_result)
            assert_that(expected_result).is_subset_of(actual_result)

    def verify_equal_ignore(self, actual_result, expected_result, list_ignore=[]):
        """Asserts the actual is equal to expected ignoring params"""
        with soft_assertions():
            logger.info("*****Expected******")
            logger.info(expected_result)
            logger.info("*****Actual******")
            logger.info(actual_result)
            logger.info(list_ignore)
            logger.info(type(list_ignore))
            logger.info(type(actual_result))
            logger.info(type(expected_result))
            assert_that(actual_result).is_equal_to(expected_result, ignore=list_ignore)

    def verify_subset_ignore(self, response, body, ignore=[]):
        """Asserts the expected is subset of actual ignoring params"""
        with soft_assertions():
            if ignore:
                logger.info('Ignoring: ', ignore)
                for key in ignore:
                    body.pop(key)
            logger.info('*****Expected******')
            logger.info(body)
            logger.info('*****Actual******')
            logger.info(response)
            assert_that(body).is_subset_of(response)
