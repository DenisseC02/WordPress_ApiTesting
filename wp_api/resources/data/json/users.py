from libraries.utils.random_generator import RandomGenerator


name, lastname, username, email = RandomGenerator().generate_email()
password = RandomGenerator().generate_password()
role = RandomGenerator().generate_random_choice(['subscriber', 'administrator', 'contributor', 'author', 'editor', ''])
admin_color = RandomGenerator().generate_random_choice(['fresh', 'light', 'modern', 'blue', 'coffee', 'ectoplasm',
                                                        'midnight', 'ocean', 'sunrise'])


create_user = {
    'password': f"{password}",
    'username': f"{username}",
    'email': f"{email}",
    'role': f"{role}",
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

update_user = {
    'password': f"updated_{password}",
    'email': f"updated_{email}",
    'role': f"{role}",
    'first_name': f"updated_{name}",
    'last_name': f"updated_{lastname}"
    }

update_password = {'password': f"updated_{password}"}
update_email = {'email': f"updated_{email}"}
update_role = {'role': f"{role}"}
update_firstname = {'first_name': f"updated_{name}"}
update_lastname = {'last_name': f"updated_{lastname}"}
update_username = {'username': f"updated_{username}"}

user_without_password = {
    'username': f"{username}",
    'email': f"{email}",
    'role': f"{role}",
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

user_without_username = {
    'password': f"{password}",
    'email': f"{email}",
    'role': f"{role}",
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

user_without_email = {
    'password': f"{password}",
    'username': f"{username}",
    'role': f"{role}",
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

user_admin_color = {
    'password': f"{password}",
    'username': f"{username}",
    'email': f"{email}",
    'role': f"{role}",
    'first_name': f"{name}",
    'last_name': f"{lastname}",
    'admin_color':  f"{admin_color}"
    }

path_create_schema = r'wp_api\resources\data\schemas\users\create_user.json'
path_delete_schema = r'wp_api\resources\data\schemas\users\delete_user.json'
path_get_schema = r'wp_api\resources\data\schemas\users\get_user.json'
path_update_schema = r'wp_api\resources\data\schemas\users\update_user.json'
path_error_schema = r'wp_api\resources\data\schemas\users\error_user.json'
path_error_data_schema = r'wp_api\resources\data\schemas\users\error_user_data.json'
path_error_user_put_username = r'wp_api\resources\data\schemas\users\error_user_put_username.json'
