import requests
from libraries.authentication.authorization import Authorization


class Bearer(Authorization):
    """Authorization using bearer token method"""

    def authentication(self, token) -> tuple:
        """Returns session authorization using bearer token method"""
        params = {}
        session = requests.Session()
        session.headers.update({'Authorization': 'Bearer ' + token})
        return session, params
