from abc import ABC
from abc import abstractmethod


class Authorization(ABC):
    '''Parent authorization class'''

    @abstractmethod
    def authentication(self, *kwargs) -> tuple:
        '''Returns session authorization'''
        pass
