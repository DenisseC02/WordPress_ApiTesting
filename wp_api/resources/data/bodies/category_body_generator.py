from libraries.utils.name_generator import NameGenerator


class CategoryBodyGenerator:
    def create_body_category(self):
        '''Generate a random category body'''
        generator = NameGenerator()
        category_name = generator.generate_name('category', 5)
        description = generator.generate_name('this is a description ', 50)
        body_complete = {
            'name': category_name,
            'description': description,
            'slug': category_name.lower(),
            'meta': []
        }
        return body_complete
