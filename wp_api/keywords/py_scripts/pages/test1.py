import os
from libraries.authentication.basic import UserAuthentication
from libraries.requests.wp_request import WpRequest
from libraries.assertions.verification import Verification


class PageState:

    def get_pages(self):
        session = UserAuthentication().authentication(user=os.getenv("USER"), password=os.getenv("PASS"))
        print(session)
        url = os.getenv("URL")
        print(url)
        result = WpRequest(session, url)
        list_page = result.wp_get()
        print(list_page)
        return result
