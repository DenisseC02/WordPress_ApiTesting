from wp_api.resources.config import config
from libraries.requests.custom_request import CustomRequest
from libraries.authentication.custom_session import CustomSession
from libraries.process_data.url_assembler import UrlAssembler

session = CustomSession().create_session()
