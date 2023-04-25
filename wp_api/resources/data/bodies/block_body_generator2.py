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
