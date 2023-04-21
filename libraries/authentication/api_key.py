import requests
from libraries.authentication.authorization import Authorization


class Api_Key(Authorization):
    """Generates users valid API key"""

    def authentication(self, key, token, add_to) -> tuple:
        """Returns session authorization using API key method"""
        session = requests.Session()
        params = {}
        if 'params' == add_to:
            params = {'key': key, 'token': token}
        else:
            session.headers.update({'Authorization': f'key {key},'f' token {token}'})
        return session, params
