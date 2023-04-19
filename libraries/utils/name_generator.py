import random
import string


class NameGenerator:
    def __init__(self):
        self.nums_generated = set()

    def generate_name(self, element, num):
        """Generate a random name with the format "Category00000000xxxxxxxx"."""
        while True:
            rand_num = str(random.randint(1, (pow(10, num)-1))).zfill(num)
            if rand_num not in self.nums_generated:
                self.nums_generated.add(rand_num)
                break
        rand_characters = ''.join(
            random.choice(string.ascii_uppercase) for _ in range(num))
        element_name = f"{element}{rand_num}{rand_characters}"
        return element_name

    def generate_number(self):
        """Generate a random name with the format "Category00000000xxxxxxxx"."""
        rand_num = str(random.randint(100, 900)).zfill(3)

        return rand_num
