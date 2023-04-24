from assertpy import assert_that


class MakeRequest(object):
    '''Makes different types of requests'''
    
    def __init__(self, session, url, params):
        self.session = session
        self.url = url
        self.params = params

    def method_post(self, body, expected_status=200):
        '''Makes a post request'''
        result = self.session.post(self.url, data=body, params=self.params)
        assert_that(expected_status).is_equal_to(result.status_code)
        return result

    def method_get(self, expected_status=200):
        '''Makes a get request'''
        result = self.session.get(self.url, params=self.params)
        assert_that(expected_status).is_equal_to(result.status_code)
        return result

    def method_put(self, body, expected_status=200):
        '''Makes a put request'''
        result = self.session.put(self.url, json=body, params=self.params)
        assert_that(expected_status).is_equal_to(result.status_code)
        return result

    def method_delete(self, expected_status=200):
        '''Makes a delete request'''
        result = self.session.delete(self.url, params=self.params)
        assert_that(expected_status).is_equal_to(result.status_code)
        return result
