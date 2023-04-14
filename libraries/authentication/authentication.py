import requests
from libraries.authentication.autorization import Autorization
from requests.auth import HTTPBasicAuth


class UserAuthentication(Autorization):
    """"""
    def __init__(self, type="Basic"):
        self.type = type

    def authentication(self, user, password) -> object:
        session = requests.Session()
        session.auth = (user, password)
        return session

    def get_auth(self, user_name, password, **kwargs):
        return HTTPBasicAuth(user_name, password)
