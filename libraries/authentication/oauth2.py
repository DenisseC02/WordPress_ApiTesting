import requests
from libraries.authentication.authorization import Authorization


class OAuth2(Authorization): 
    """Creates a session using OAuth 2.0"""

    def authentication(self, server, client_id, client_secret, **kwargs):
        """Returns a session using OAuth 2.0"""
        params = {}
        headers = {'content-type': 'application/x-www-form-urlencoded'}
        data = {'grant_type': 'client_credentials', 'client_id': client_id,
                'client_secret': client_secret}
        response = requests.post(server, headers=headers, data=data)
        session = requests.Session()
        session.headers.update(
            {'Authorization': 'Bearer ' + response.json()['access_token']})
        return session, params
