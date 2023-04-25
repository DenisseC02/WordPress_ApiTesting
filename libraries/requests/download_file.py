import os
import requests


class DownloadFile(object):
    '''Downloads and deletes file on demand'''

    def download(self, file_url):
        '''Returns the local path of downloaded file'''
        self.file_url = file_url
        response = requests.get(self.file_url)
        with open(os.path.basename(self.file_url), 'wb') as file:
            file.write(response.content)
            download_location = file.name
        return download_location
    
    def delete_local_file(self, file_path):
        '''Deletes  a file from a path'''
        self.file_path  = file_path
        os.remove(file_path)
