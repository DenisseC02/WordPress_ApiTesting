import random
from robot.api import logger

class DictionaryRandomVaule(object):
    '''Gets a random valñue from a dictionary'''

    def __init__(self) -> None:
        pass

    def get_random_dictionary_value(self, dictionary):
        '''Returns a random value from a dictionary'''
        self.dictionary = dictionary
        if type(self.dictionary) is dict:
            values = list(self.dictionary.values())
            choosen_value = random.choice(values)
            logger.info("Choosen value: " + choosen_value)
            return choosen_value
