class Decode(object):
    @staticmethod
    def decode_response(response):
        decoded_result = response.content
        decoded_result.decode('utf-8')
        return decoded_result
