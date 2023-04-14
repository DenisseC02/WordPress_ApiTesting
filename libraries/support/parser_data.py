import json


class ParserData(object):
    @staticmethod
    def parser(response, key):
        data = json.loads(response)
        return data[key]


