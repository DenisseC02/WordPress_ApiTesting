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
body_parent1 = {'title':'Robot page','content':'Welcome to the robot page', 'status':'publish'}
body_child11 = {'title':'New robot title','content':'This page was created by robot', 'status':'publish'}
body_child12 = {'title':'Hi from robot','content':'Hello from robot', 'status':'publish'}
body_parent2 = {'title':'Robot page!','content':'Welcome to the new page', 'status':'publish'}
body_child21 = {'title':'Robot page','content':'Page to delete', 'status':'publish'}
body_child22 = {'title':'New robot title','content':'This page was created by robot', 'status':'publish'}
code = {'code': 'rest_invalid_param'}
ignore_list = [('guid','raw'), 'password', ('title', 'raw'), ('content','raw'), ('content','block_version'), ('excerpt','raw'), 'permalink_template', 'generated_slug', '_links']
path_create_schema = 'wp_api/resources/data/schemas/posts/create_post.json'
path_list_schema = 'wp_api/resources/data/schemas/posts/list_post.json'
path_update_schema = 'wp_api/resources/data/schemas/posts/update_post.json'
path_delete_schema = 'wp_api/resources/data/schemas/posts/delete_post.json'
post_delete = {'deleted': True}

