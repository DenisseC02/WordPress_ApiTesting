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
