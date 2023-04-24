import random
import string


class NameGenerator:
    def __init__(self):
        self.nums_generated = set()

    def generate_name(self, element, num):
        '''Generate a random name with the format 'Category00000000xxxxxxxx'.'''
        while True:
            rand_num = str(random.randint(1, (pow(10, num)-1))).zfill(num)
            if rand_num not in self.nums_generated:
                self.nums_generated.add(rand_num)
                break
        rand_characters = ''.join(
            random.choice(string.ascii_uppercase) for _ in range(num))
        element_name = f'{element}{rand_num}{rand_characters}'
        return element_name

    def generate_number(self):
        '''Generate a random number from 100 to 999'''
        rand_num = str(random.randint(100, 999)).zfill(3)
        return rand_num

    def create_body_category(self):
        '''Generate a random category body'''
        category_name = self.generate_name('category', 5)
        body_complete = {
            'name': category_name,
            'description': self.generate_name(
                'this is a description ',
                50),
            'slug': category_name.lower(),
            'meta': []
        }
        return body_complete
