import requests
from libraries.authentication.authorization import Authorization


class OAuth2(Authorization): 
    """Creates a session using OAuth 2.0"""

    def authentication(self, server, client_id, client_secret, **kwargs):
        """TO DO"""
        params={}
        session = requests.Session()
        return session, params
