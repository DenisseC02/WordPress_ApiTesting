from dotenv import load_dotenv
import requests
import os
from libraries.authentication.authentication import UserAuthentication
from libraries.support.parser_data import ParserData
from libraries.support.decode import Decode

load_dotenv()


class WpRequest(object):
    def __init__(self, user, password, url):
        self.user = user
        self.password = password
        self.url = url

    def wp_post(self, body):
        session = UserAuthentication().authentication(self.user, self.password)
        result = session.post(self.url, params=body)
        return result

    def wp_get(self, id=""):
        session = UserAuthentication().authentication(self.user, self.password)
        result = session.get('%s/%s' % (self.url, id))
        return result

    def wp_put(self, params, id=""):
        session = UserAuthentication().authentication(self.user, self.password)
        result = session.put('%s/%s' % (self.url, id), json=params)
        return result

    def wp_delete(self, id=""):
        session = UserAuthentication().authentication(self.user, self.password)
        result = session.delete('%s/%s' % (self.url, id))
        return result


body = {"password": "12345", "title": "sisisisisisisisissisi", "content": "content", "status": "publish"}
params = {"password": "12345", "title": "nononononono", "content": "content", "status": "publish"}

session = UserAuthentication().authentication(self.user, self.password)

result = WpRequest(user=os.getenv("USER"), password=os.getenv("PASS"),
                                  url="http://localhost/wordpress/wp-json/wp/v2/pages")


post1 = result.wp_post(body=body)
result2 = Decode().decode_response(response=post1)
result3 = ParserData().parser(result2, "id")
get1 = result.wp_get(result3)
put1 = result.wp_put(params=params, id=result3)
get2 = result.wp_get(result3)
# delete1 = result.wp_delete(result3)

print(post1)
print(result2)
print(result3)
print(get1)
print(put1)
print(get2)
# print(delete1)
# wp_get(user=os.getenv("USER"), password=os.getenv("PASS"), url=f"http://localhost/wordpress/wp-json/wp/v2/pages/{result3}")
# # wp_get(user=os.getenv("USER"), password=os.getenv("PASS"), url="http://localhost/wordpress/wp-json/wp/v2/pages/57")
# wp_delete(user=os.getenv("USER"), password=os.getenv("PASS"), url=f"http://localhost/wordpress/wp-json/wp/v2/pages/{result3}")



# "http://localhost/wordpress/wp-json/wp/v2/blocks"
# user = os.getenv("USER")
    # password = os.getenv("PASS")
# user = os.getenv("USER")
# password = os.getenv("PASS")
# print(session1)
# body = {"password": "12345", "title": "blosisisisisisisisisissisi", "content": "content", "status": "publish"}

# def prueba2(path, user_name=user, password=password, exp_status=200, **kwargs):
#     basic = get_auth(user_name, password, **kwargs)
#     url = '%s/%s' % (get_env_value("URL"), path)
#     # print(url)
#     response = requests.get(url, auth=basic)
#     assert response.status_code == exp_status, 'Actual response is %s, expect: %s' % (response.status_code, exp_status)
#     return json.loads(response.text)