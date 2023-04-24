import os
import requests
from robot.api import logger


class DownloadFile(object):

    def __init__(self) -> None:
        pass

    def download(self, file_url):
        self.file_url = file_url
        response = requests.get(self.file_url)
        with open(os.path.basename(self.file_url), 'wb') as file:
            file.write(response.content)
            download_location = file.name
        return download_location
    
    def delete_local_file(self, file_path):
        self.file_path  = file_path
        os.remove(file_path)