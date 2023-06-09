from os import getenv
from libraries.authentication.api_key import Api_Key
from libraries.authentication.basic import Basic
from libraries.authentication.bearer import Bearer
from libraries.authentication.no_auth import NoAuthentication
from libraries.authentication.oauth2 import OAuth2

key = getenv('KEY')
value = getenv('VALUE')
add_to = getenv('ADD_TO')
user = getenv('USER')
password = getenv('PASSWORD')
token = getenv('TOKEN')
server = getenv('SERVER')
client_id = getenv('CLIENT_ID')
client_secret = getenv('CLIENT_SECRET')

authentication_type = {
    'api_key': Api_Key,
    'basic': Basic,
    'bearer': Bearer,
    'no_auth': NoAuthentication,
    'oauth_2': OAuth2
}
data = {
    'api_key': [key, value, add_to],
    'basic': [user, password],
    'bearer': [token],
    'no_auth': [],
    'oauth_2': [server, client_id, client_secret]
}

class CustomSession:
    '''Creates custom session'''
    
    def create_session(self):
        '''Returns created session on demand'''
        authentication_method = getenv('AUTHENTICATION_METHOD')
        authorization = authentication_type[authentication_method]
        data_args = data.get(authentication_method)
        session, params = authorization().authentication(*data_args)
        return session, params

    def create_custom_session(self, user, password):
        '''Returns created custom session on demand'''
        authentication_method = getenv('AUTHENTICATION_METHOD')
        authorization = authentication_type[authentication_method]
        data_args = data.get(authentication_method)
        session, params = authorization().authentication(user, password)
        return session, params
