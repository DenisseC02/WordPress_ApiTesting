body_tb86_post = {'title':'My first page', 'content':'', 'status':'publish', 'categories':'', 'tags':''}
body_tb87_post = {'title':'Test save as draft', 'content':'', 'status':'draft', 'categories':'', 'tags':''}
body_tb87_put = {'title':'Test save as draft', 'content':'', 'status':'publish', 'categories':'', 'tags':''}
body_tb88_post = {'title':'My first page', 'content':'', 'status':'publish', 'categories':'', 'tags':'123'}
body_tb88_put = {'title':'My first page', 'content':'', 'status':'draft', 'categories':'', 'tags':'123'}
body_tb88a_post = {'title':'My first page', 'content':'', 'status':'draft', 'categories':'', 'tags':'123', 'ping_status':'closed'}
body_tb88a_put = {'title':'My first page', 'content':'', 'status':'publish', 'categories':'', 'tags':'123', 'ping_status':'closed'}
body_tb89_post = {}
body_tb90_post = {'title':'test comment status', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'closed'}
body_tb90_put = {'title':'test comment status', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'open'}
body_tb91_post = {'title':'Tests in Robot', 'content':'animation', 'status':'publish'}
body_tb91_slug = {'title':'Test in ROnot 2','content':'animation robot', 'status':'publish', 'slug':'this is the new slug'}
body_tb91a_post = {'title':'test ping status', 'content':'', 'status':'publish', 'categories':'', 'ping_status':'closed'}
body_tb91a_put = {'title':'test ping status', 'content':'', 'status':'publish', 'categories':'', 'ping_status':'open'}
body_tb92_post = {'title':'Tests in Robot', 'content':'animation', 'status':'publish'}
body_tb92_put = {'title':'','content':'animation robot', 'status':'publish', 'slug':'this is the new slug'}
body_tb95_post = {'title':'test tag', 'content':'', 'status':'publish', 'categories':'', 'tags':'123456'}
body_tb95_put = {'title':'test tag', 'content':'', 'status':'publish', 'categories':'', 'tags':'****'}
body_tb96_post = {'title':'test status', 'content':'', 'status':'publish', 'categories':''}
body_tb96_put = {'title':'test status', 'content':'', 'status':'***', 'categories':'', 'tags':'****'}
body_tb97_post = {'title':'test comment status', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'open'}
body_tb97_put = {'title':'comment status', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'****'}
body_tb98_post = {'title':'My Posts', 'content':'This is new', 'status':'publish', 'categories':''}
body_tb99_post = {'title':'test delete', 'content':'', 'status':'draft', 'categories':''}
body_tb100_post = {'title':'comment status del', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'closed'}
body_tb11_post = {'title':'comment status del', 'content':'', 'status':'publish', 'categories':'', 'comment_status':'open'}
body_private = {'title':'Robot post','content':'Welcome to the robot post', 'status':'private'}
body_draft = {'title':'New robot title','content':'This post was created by robot', 'status':'draft'}
body_pending = {'title':'Hi from robot','content':'New post', 'status':'pending'}
body_future = {'title':'Robot post!','content':'Welcome to the new post', 'status':'future'}
body_pending1 = {'title':'My Posts', 'content':'This is new', 'status':'pending'}
body_pending2 = {'title':'My second Posts', 'content':'This is new', 'status':'pending'}
body_pending3 = {'title':'My third Posts', 'content':'This is new', 'status':'pending'}
body_private1 = {'title':'Tests in Robot 1', 'content':'animation', 'status':'private'}
body_private2 = {'title':'Tests in Robot 2', 'content':'animation', 'status':'private'}
body_private3 = {'title':'Tests in Robot 3', 'content':'animation', 'status':'private'}
body_child21 = {'title':'Robot page','content':'Page to delete', 'status':'publish'}
body_child22 = {'title':'New robot title','content':'This page was created by robot', 'status':'publish'}
code = {'code': 'rest_invalid_param'}
status_public = 'publish'
status_draft = 'draft'
status_pending = 'pending'
status_private = 'private'
ignore_list = [('guid','raw'), 'password', ('title', 'raw'), ('content','raw'), ('content','block_version'), ('excerpt','raw'), 'permalink_template', 'generated_slug', '_links']
path_create_schema = r'wp_api\resources\data\schemas\posts\create_post.json'
path_list_schema = r'wp_api\resources\data\schemas\posts\list_post.json'
path_update_schema = r'wp_api\resources\data\schemas\posts\update_post.json'
path_delete_schema = r'wp_api\resources\data\schemas\posts\delete_post.json'
post_delete = {'deleted': True}
message_response = {'code': 'empty_content'}
message_deleted = {'message': 'Invalid post ID.'}
