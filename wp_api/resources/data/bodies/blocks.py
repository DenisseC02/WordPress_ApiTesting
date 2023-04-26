create_block_schema = r'wp_api\resources\data\schemas\blocks\create_block_schema.json'
read_block_schema = r'wp_api\resources\data\schemas\blocks\read_block_schema.json'
wrong_status_schema = r'wp_api\resources\data\schemas\blocks\data_error_block_schema.json'
body_wrong = {'sta': 'publish'}
body_create = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'publish','password': '12345678'}
body_update = {'title': 'My Block edited', 'content': '[my-block edited]','status': 'publish'}
delete = {'force': True}
verify_delete ={'message': 'Invalid post ID.'}
ignore = ['guid', 'modified_gmt', 'slug', 'password', ('content', 'block_version'), '_links']
verify_delete = {'message': 'Invalid post ID.'}
ignore = ['guid',  'modified_gmt',  'slug',  'password',  ('content',  'block_version'),  '_links']
update_id = {'id': 500}
extraurl = '?_field=id'
publish = {'status': 'publish'}
id_filter = '?_field=id'
