import string
import random


class RandomGenerator(object):
    """Generates a random password generator"""
    vowels = 'aeiou'
    consonants = ''.join(set(string.ascii_lowercase) - set(vowels))
    digits = string.digits
    special_characters = string.punctuation

    def generate_name(cls):
        """Generate a random name"""
        name = ''.join(random.choice(cls.consonants) + random.choice(cls.vowels) for _ in range(3))
        return name

    def generate_last_name(cls):
        """Generate a random last name ."""
        last_name = ''.join(random.choice(cls.consonants) + random.choice(cls.vowels) for _ in range(5))
        return last_name

    def generate_username(cls):
        """Generate a radonom username"""
        name = cls.generate_name()
        last_name = cls.generate_last_name()
        username = f"{name}_{last_name}"
        return name, last_name, username

    def generate_email(cls):
        """Generate random email address """
        name, last_name, username = cls.generate_username()
        email = f"{username}@gmail.com"
        return name, last_name, username, email

    def generate_number(cls):
        """Generate a random number """
        number = random.randint(1, 9)
        return number

    def generate_password(cls, length=8):
        """Generate a random password """
        all_chars = cls.vowels + cls.consonants + cls.digits
        password = ''.join(random.choice(all_chars) for _ in range(length))
        return password

    def generate_random_choice(cls, word_list):
        """Returns a random choice from a list"""
        choice = random.choice(word_list)
        return choice
