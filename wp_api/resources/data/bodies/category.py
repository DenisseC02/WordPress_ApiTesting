from libraries.utils.name_generator import NameGenerator


name_generator = NameGenerator()
category_name = name_generator.generate_name('category', 5)
category_name2 = name_generator.generate_name('category', 5)

body_complete = {
    'name': category_name,
    'description': name_generator.generate_name('this is a description ', 50),
    'slug': category_name.lower(),
    'meta': []
}

body_complete2 = {
    'name': category_name2,
    'description': name_generator.generate_name('this is a description ', 50),
    'slug': category_name2.lower(),
    'meta': []
}

body_just_name = {
    'name': name_generator.generate_name('category', 5)
}

body_just_description = {
    'description': name_generator.generate_name('this is a description ', 50)
}

body_long_description = {
    'description': name_generator.generate_name('this is a description ',
                                                500000)
}

body_edit_wrong_meta_number = {
    'meta': 10
}

body_edit_wrong_meta_string = {
    'meta': 'string'
}

body_edit_wrong_parent_dict = {
    'parent': {}
}

body_edit_wrong_parent_list = {
    'parent': []
}

body_edit_nonexistent_parent = {
    'parent': 10000000000
}

body_edit_description_int = {
    'description': 10
}

body_edit_description_list = {
    'description': []
}

body_edit_description_dict = {
    'description': {}
}

error_missing_name = {
    'code': 'rest_missing_callback_param',
    'message': 'Missing parameter(s): name',
    'data': {
        'status': 400,
        'params': [
            'name'
        ]
    }
}

error_invalid_meta = {
    'code': 'rest_invalid_param',
    'message': 'Invalid parameter(s): meta',
    'data': {
        'status': 400,
        'params': {
            'meta': 'Invalid parameter.'
        },
        'details': []
    }
}

error_invalid_parent = {
    'code': 'rest_invalid_param',
    'message': 'Invalid parameter(s): parent',
    'data': {
        'status': 400,
        'params': {
            'parent': 'parent is not of type integer.'
        },
        'details': {
            'parent': {
                'code': 'rest_invalid_type',
                'message': 'parent is not of type integer.',
                'data': {
                    'param': 'parent'
                }
            }
        }
    }
}

error_invalid_description = {
    'code': 'rest_invalid_param',
    'message': 'Invalid parameter(s): description',
    'data': {
        'status': 400,
        'params': {
            'description': 'description is not of type string.'
        },
        'details': {
            'description': {
                'code': 'rest_invalid_type',
                'message': 'description is not of type string.',
                'data': {
                    'param': 'description'
                }
            }
        }
    }
}

error_parent_does_not_exist = {
    'code': 'rest_term_invalid',
    'message': 'Parent term does not exist.',
    'data': {
        'status': 400
    }
}

error_term_does_not_exist = {
    'code': 'rest_term_invalid',
    'message': 'Term does not exist.',
    'data': {
        'status': 404
    }
}

error_term_exist = {
    'code': 'term_exists',
    'message': 'A term with the name provided already exists with this parent.'
}

error_slug_exist = {
    'code': 'duplicate_term_slug',
    'message': 'The slug &#8220;category49162lwwko&#8221;'
               ' is already in use by another term.',
    'data': None
}
