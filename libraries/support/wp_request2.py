from dotenv import load_dotenv
import requests
import os
import json
from libraries.authentication.authentication import UserAuthentication
from libraries.support.parser_data import ParserData
from libraries.support.decode import Decode
from libraries.support.verification import Verification

load_dotenv()


class WpRequest(object):
    def __init__(self, session, url):
        self.session = session
        self.url = url

    def wp_post(self, body):
        result = self.session.post(self.url, params=body)
        return result

    def wp_get(self, id=""):
        result = self.session.get('%s/%s' % (self.url, id))
        return result

    def wp_put(self, params, id=""):
        result = self.session.put('%s/%s' % (self.url, id), json=params)
        return result

    def wp_delete(self, id=""):
        result = self.session.delete('%s/%s' % (self.url, id))
        return result


body = {"password": "12345", "title": "sisisisisisi", "content": "content", "status": "publish"}
params = {"password": "12345", "title": "nononononono", "content": "content", "status": "publish"}

session = UserAuthentication().authentication(user=os.getenv("USER"), password=os.getenv("PASS"))

result = WpRequest(url="http://localhost/wordpress/wp-json/wp/v2/pages", session=session)

post1 = result.wp_post(body=body)
verification = Verification().test_assertions(r"C:\Users\GamerStoreCbba\PycharmProjects\WordPress_ApiTesting\wp_api\resources\data\schemas\post_pages.json", post1.json())
result2 = Decode().decode_response(response=post1)
jsonfile = json.loads(result2)
# verification = Verification().test_assertions(r"C:\Users\GamerStoreCbba\PycharmProjects\WordPress_ApiTesting\wp_api\resources\data\schemas\post_pages.json", jsonfile)
result3 = ParserData().parser(result2, "id")
get1 = result.wp_get(result3)
put1 = result.wp_put(params=params, id=result3)
get2 = result.wp_get(result3)
# delete1 = result.wp_delete(result3)

print(post1)
print(result2)
print(jsonfile)
print(result3)
print(get1)
print(put1)
print(get2)
