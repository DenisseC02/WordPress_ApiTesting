from libraries.utils.random_generator import RandomGenerator


name, lastname, username, email = RandomGenerator().generate_email()
password = RandomGenerator().generate_password()
roles = ['subscriber', 'administrator', 'contributor', 'author', 'editor', '']
role = RandomGenerator().generate_random_choice(roles)
admin_color = RandomGenerator().generate_random_choice(['fresh', 'light', 'modern', 'blue', 'coffee', 'ectoplasm',
                                                        'midnight', 'ocean', 'sunrise'])


create_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': 'subscriber',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_subscriber_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[0]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_administrator_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[1]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_contributor_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[2]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_author_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[3]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_editor_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[4]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_without_role_user = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{roles[4]}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

update_user = {
    'password': f'updated_{password}',
    'email': f'updated_{email}',
    'role': f'{role}',
    'first_name': f'updated_{name}',
    'last_name': f'updated_{lastname}'
    }

update_password = {'password': f'updated_{password}'}
update_email = {'email': f'updated_{email}'}
update_role = {'roles': 'administrator'}
update_firstname = {'first_name': f'updated_{name}'}
update_lastname = {'last_name': f'updated_{lastname}'}
update_username = {'username': f'updated_{username}'}

user_without_password = {
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{role}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

user_without_username = {
    'password': f'{password}',
    'email': f'{email}',
    'roles': f'{role}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

user_without_email = {
    'password': f'{password}',
    'username': f'{username}',
    'roles': f'{role}',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

create_60_character_username = {
    'password': f'{password}',
    'username': 'zvm2WOuKQEmQxs8AeXCmio0NJJxS2oL221JHEk5tSl24dcJnVaXZBqfO5bsp2',
    'email': f'{email}',
    'roles': 'subscriber',
    'first_name': f'{name}',
    'last_name': f'{lastname}'
    }

user_admin_color = {
    'password': f'{password}',
    'username': f'{username}',
    'email': f'{email}',
    'roles': f'{role}',
    'first_name': f'{name}',
    'last_name': f'{lastname}',
    'admin_color':  f'{admin_color}'
    }

create_subscriber_user_schema = 'wp_api/resources/data/schemas/users/create_subscriber_user.json'
create_editor_user_schema = 'wp_api/resources/data/schemas/users/create_editor_user.json'
path_delete_schema = 'wp_api/resources/data/schemas/users/delete_user.json'
path_get_schema = 'wp_api/resources/data/schemas/users/get_user.json'
path_update_schema = 'wp_api/resources/data/schemas/users/update_user.json'
path_error_schema = 'wp_api/resources/data/schemas/users/error_user.json'
path_error_data_schema = 'wp_api/resources/data/schemas/users/error_user_data.json'
path_error_user_put_username = 'wp_api/resources/data/schemas/users/error_user_put_username.json'
