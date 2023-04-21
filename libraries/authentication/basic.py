import requests
from libraries.authentication.authorization import Authorization


class Basic(Authorization): 
    '''Authorization using basic method'''   

    def authentication(self, user, password) -> tuple:
        '''Creates a session with basic authentication'''
        params = {}
        session = requests.Session() 
        session.auth = (user, password) 
        return session, params
