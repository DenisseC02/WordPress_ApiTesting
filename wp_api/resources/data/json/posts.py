body_tb86_post = {'title':'My first page', 'content':'', 'status':'publish', 'categories':'', 'tags':''}
body_tb87_post = {'title':'My first page', 'content':'', 'status':'draft', 'categories':'', 'tags':''}
body_tb87_put = {'title':'New page 2', 'content':'', 'status':'publish', 'categories':'', 'tags':''}
body_tb89_post = {'title':'New page 2', 'content':'', 'status':'publish', 'categories':'', 'tags':''}
body_tb89_put = {'title':''}
code = {'code':'empty_content'}
ignore_list = [('guid','raw'), 'password', ('title', 'raw'), ('content','raw'), ('content','block_version'), ('excerpt','raw'), 'permalink_template', 'generated_slug', '_links']
path_list_schema = r'wp_api\resources\data\schemas\posts\list_post.json'
path_update_schema = r'wp_api\resources\data\schemas\posts\update_post.json'
path_delete_schema = r'wp_api\resources\data\schemas\posts\delete_post.json'
post_status = {"deleted": "true"}
