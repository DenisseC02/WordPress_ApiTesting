from os import getenv


class UrlAssembler:
    '''Assemble the end point URL'''

    def get_url(self, **kwargs):
        """Returns the URL"""
        base_url = getenv("HOST")
        end_point = getenv("END_POINT")
        # port = getenv("PORT")
        # url = '%s:%s/%s' % (base_url, port, end_point)
        url = '%s/%s' % (base_url, end_point)
        for extra_path in kwargs:
            extra_path_value = kwargs.get(extra_path)
            url = '%s/%s' % (url, extra_path_value)
        return url
