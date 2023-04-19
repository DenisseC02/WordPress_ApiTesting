import json
import jsonschema
from robot.api import logger
from assertpy import soft_assertions
from assertpy import assert_that


class Verification(object):
    """A Verification class"""
    def test_assertions(self, expected_result, actual_result):
        """Asserts that the expected result is equal to the expected_result"""
        with soft_assertions():
            with open(expected_result, 'r') as schema:
                schema = json.load(schema)
            logger.info("*****Expected******")
            logger.info(schema)
            logger.info("*****Actual******")
            logger.info(actual_result)
            assert_that(actual_result).is_equal_to(schema)

    def test_response_value(self, expected_result, actual_result):
        """Asserts that certain response element
        is equal to the expected result"""
        with soft_assertions():
            logger.info("*****Expected******")
            logger.info(expected_result)
            logger.info("*****Actual******")
            logger.info(actual_result)
            assert_that(actual_result).is_equal_to(expected_result)

    def test_response_type(self, response, response_type):
        """Asserts that the response is of certain type"""
        with soft_assertions():
            logger.info("*****Expected******")
            logger.info(response_type)
            logger.info("*****Actual******")
            logger.info(type(response))
            assert_that(response).is_instance_of(eval(response_type))

    def verify_schema(self, path_json_schema, response): 
        with soft_assertions(): 
            with open(path_json_schema, 'r') as schema1: 
                schema = json.load(schema1) 
                logger.info("*****Expected******")
                logger.info(schema)
                logger.info("*****Actual******")
                logger.info(response)
                result_validation=jsonschema.validate(response, schema) 
                assert result_validation is None