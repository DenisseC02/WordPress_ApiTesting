create_block_schema = r'C:\Users\Roger\Documents\jalasoft\API_Testing\WordPress_ApiTesting\wp_api\resources\data\schemas\create_block_schema.json'
read_block_schema = r'C:\Users\Roger\Documents\jalasoft\API_Testing\WordPress_ApiTesting\wp_api\resources\data\schemas\read_block_schema.json'
body_wrong = {'sta': 'publish'}
body_create =  {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'publish','password': '12345678'}
body_update = {'title': 'My Block edited', 'content': '[my-block edited]','status': 'publish'}
delete = {'force': True}
verify_delete =  {'message': 'Invalid post ID.'}
ignore = ['guid','modified_gmt','slug','password',('content','block_version'),'_links']
update_id = {'id': 500}

extraurl = '?_field=id'