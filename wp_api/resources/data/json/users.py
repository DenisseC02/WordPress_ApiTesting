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


update_contact = {
    "attributes": {
        "FIRSTNAME": "updated_name",
        "LASTNAME": "updated_lastname"
    }
}
