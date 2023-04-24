import os
import mimetypes
from robot.api import logger


class FileUpload(object):
    '''Build header and body to upload a file'''

    def __init__(self):
        pass

    def update_session(self, session, file_path, expected_status=200):
        '''Returns updated session with required headers and body'''
        self.session = session
        self.file_path  = file_path
        self.expected_status = expected_status
        headers = self._header_builder()
        body = self._body_builder()
        self.session.headers.update(headers)
        return self.session, body

    def _header_builder(self):
        '''Builds header requirement'''
        headers = dict()
        mimetype, encoding = mimetypes.guess_type(self.file_path)
        filename = os.path.basename(self.file_path)
        headers.update({'Content-Type': mimetype})
        headers.update({'Content-Disposition': 'attachment; filename="' + filename + '"'})
        return headers

    def _body_builder(self):
        '''Build body requirement'''
        with open(self.file_path, 'rb') as file:
            body = file.read()
        return body
