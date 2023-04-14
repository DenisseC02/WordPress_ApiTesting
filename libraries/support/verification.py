import json
import jsonschema
from robot.api import logger
from assertpy import soft_assertions, assert_that


class Verification(object):
    def test_assertions(self, expected_result, actual_result):
        with soft_assertions():
            with open(expected_result, 'r') as schema:
                schema = json.load(schema)
            print('Expected result:', schema)
            logger.info("*****Expected******")
            logger.info(schema)
            logger.info("*****Actual******")
            logger.info(actual_result)
            # assert_that(actual_result).is_equal_to(schema)
            result_validation = jsonschema.validate(actual_result, schema)
            assert result_validation is None

