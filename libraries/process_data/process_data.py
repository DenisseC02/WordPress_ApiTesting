class ProcessData:
    """Process the response"""

    def get_key_value(self, response, key):
        """Returns the value of the specified key"""
        data = response[key]
        return data
