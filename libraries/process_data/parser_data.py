import json
from libraries.process_data.decode import Decode


class ParserData(object):
    '''Evaluates response and returns result on demand'''

    def __init__(self, response, response_type):
        self.response = response
        self.response_type = response_type

    def parser_by(self, key=None):
        '''Calls the appropriate method according the required result'''
        response_types = {
            'json': self._parser_json,
            'key': self._key,
            'text': self._text,
            'binary': self._content
        }
        method_to_implement = response_types[self.response_type]
        if self.response_type == 'key':
            parser = method_to_implement(key)
        else:
            parser = method_to_implement()
        return parser

    def _key(self, key=None):
        '''Returns the value of requested key'''
        decoded_response = Decode().decode_response(self.response)
        data = json.loads(decoded_response)
        if isinstance(data, list):
            return [item[key] for item in data]
        elif isinstance(data, dict):
            return data[key]

    def _parser_json(self):
        '''Returns result as json'''
        result = self.response.json()
        return result

    def _text(self):
        '''Returns result as text'''
        result = self.response.text
        return result

    def _content(self):
        '''Returns result as bytes'''
        result = self.response.content
        return result
