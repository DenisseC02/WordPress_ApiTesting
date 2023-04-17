import requests
from libraries.authentication.authorization import Authorization


class Api_Key(Authorization):
    """Generates users valid API key"""

    def authentication(self, key, token, add_to) -> tuple:
        """Returns session authorization using API key method""" 
        params = {'key': key, 'token': token}
        session = requests.Session()
        return session, params
