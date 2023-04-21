from libraries.utils.random_generator import RandomGenerator

name, lastname, username, email = RandomGenerator().generate_email()
password = RandomGenerator().generate_password()


create_subscriber_user = {
    'password': f"{password}",
    'username': f"{username}",
    'email': f"{email}",
    'role': 'subscriber',
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

update_user = {
    'password': f"{password}",
    'username': f"{username}",
    'email': f"{email}",
    'role': 'subscriber',
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }


user_without_password = {
    'username': f"{username}",
    'email': f"{email}",
    'role': 'subscriber',
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

user_without_username = {
    'password': f"{password}",
    'email': f"{email}",
    'role': 'subscriber',
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

user_without_email = {
    'password': f"{password}",
    'username': f"{username}",
    'role': 'subscriber',
    'first_name': f"{name}",
    'last_name': f"{lastname}"
    }

path_create_schema = r'wp_api\resources\data\schemas\users\create_user.json'
path_delete_schema = r'wp_api\resources\data\schemas\users\delete_user.json'
path_get_schema = r'wp_api\resources\data\schemas\users\get_user.json'
path_update_schema = r'wp_api\resources\data\schemas\users\update_user.json'
path_error_schema = r'wp_api\resources\data\schemas\users\error_user.json'
path_error_data_schema = r'wp_api\resources\data\schemas\users\error_user_data.json'
