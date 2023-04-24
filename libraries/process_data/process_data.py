from libraries.requests.custom_request import CustomRequest
from robot.api import logger


class ProcessData:
    '''Process the response'''

    def get_key_value(self, response, key):
        '''Returns the value of the specified key'''
        data = response[key]
        return data

    def search_element_in_list (self, key, value, elements):
        '''Resturns the element selected from the list'''
        for element in elements:
            if element[key] == value:
                return element

    def delete_elements_from_list (self, elements, url, session, params):
        request = CustomRequest()
        for id in elements:
            new_url = url + '/' + str(id)
            response = request.custom_delete(session, new_url, params)
            logger.info('****Deleted Element****')
            logger.info(response)
