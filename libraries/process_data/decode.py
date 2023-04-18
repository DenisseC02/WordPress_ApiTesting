class Decode(object):
    """Decodes end point response"""

    @staticmethod
    def decode_response(response):
        """Returns decoded response"""
        decoded_result = response.content.decode('utf-8')
        return decoded_result
