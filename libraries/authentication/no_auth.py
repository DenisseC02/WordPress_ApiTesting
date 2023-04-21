import requests
from libraries.authentication.authorization import Authorization


class NoAuthentication(Authorization): 
    '''Creates a session without authentication'''

    def authentication(self) -> tuple:
        '''Returns session without authentication'''
        params = {}
        session = requests.Session() 
        return session, params
