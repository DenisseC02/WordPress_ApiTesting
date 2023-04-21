import string
import random


class RandomGenerator(object):
    vowels = 'aeiou'
    consonants = ''.join(set(string.ascii_lowercase) - set(vowels))
    digits = string.digits
    special_characters = string.punctuation

    @classmethod
    def generate_name(cls):
        name = ''.join(random.choice(cls.consonants) + random.choice(cls.vowels) for _ in range(3))
        return name

    @classmethod
    def generate_last_name(cls):
        last_name = ''.join(random.choice(cls.consonants) + random.choice(cls.vowels) for _ in range(5))
        return last_name

    @classmethod
    def generate_username(cls):
        name = cls.generate_name()
        last_name = cls.generate_last_name()
        username = f"{name}_{last_name}"
        return name, last_name, username

    @classmethod
    def generate_email(cls):
        name, last_name, username = cls.generate_username()
        email = f"{username}@gmail.com"
        return name, last_name, username, email

    @classmethod
    def generate_number(cls):
        number = random.randint(1, 9)
        return number

    def generate_password(cls, length=8):
        all_chars = cls.vowels + cls.consonants + cls.digits
        password = ''.join(random.choice(all_chars) for _ in range(length))
        return password
