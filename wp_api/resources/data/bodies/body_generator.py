from libraries.utils.random_generator import RandomGenerator

name, lastname, username, email = RandomGenerator().generate_email()
password = RandomGenerator().generate_password()
roles = ['subscriber', 'administrator', 'contributor', 'author', 'editor', '']
role = RandomGenerator().generate_random_choice(roles)


class BodyGenerator():
    """generates bodies"""
    def block_body(self, type):
        """return valid bodies"""
        type_key = type.lower()
        block_types = {
            'valid': {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'publish',
                'password': '12345678'
            },
            'draft': {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'draft',
                'password': '12345678'
            },
            'private': {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'private',
                'password': '12345678'
            },
            'pending': {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'pending',
                'password': '12345678'
            },
            'future': {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'future',
                'password': '12345678'
            },
            'empty': {},
            'status': {'status': 'publish'},
            'date': {'date': '2022-04-24T16:48:33'},
            'slug': {'slug': 'edited_slug'},
            'password': {'password': 'new password'}
        }
        block = block_types[type_key]
        return block

    def data_generator(self, type):
        """Returns invalid bodies"""
        type_key = type.lower()
        data_types = {
            'invalid status': {
                'info': {'status': 'wodjcshsj'},
                'code': 400
            },
            'invalid date': {
                'info': {'date': 'wodjcshsj'},
                'code': 400
            },
            'invalid date_gmt': {
                'info': {'date_gmt': 'wodjcshsj'},
                'code': 400
            }
        }
        data = data_types[type_key]
        return data['info'], data['code']

    def user_body(self, role):
        """return valid bodies"""
        type_key = role.lower()
        role_types = {
            'subscriber': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[0]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            },
            'administrator': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[1]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            },
            'contributor': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[2]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            },
            'author': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[3]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            },
            'editor': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[4]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            },
            'without_role': {
                'password': f'{password}',
                'username': f'{username}',
                'email': f'{email}',
                'roles': f'{roles[5]}',
                'first_name': f'{name}',
                'last_name': f'{lastname}'
            }
        }
        role_user = role_types[type_key]
        return role_user
