body_test1_post = {'title': 'New page', 'content':'Page save as draft!', 'status':'draft'}
body_test1_put = {'title':'Page update!!', 'content':'Publish!', 'status':'publish'}
body_test2_post = {'title':'Public page!!', 'content':'Page to edit', 'status':'publish'}
body_test2_put = {'title':'New robot title', 'content':'Page update!', 'status':'publish'}
body_test3_post = {'title':'Public page to edit', 'content':'This page is publish', 'status':'publish', 'comment_status':'open'}
body_test3_put = {'title':'Robot page!', 'content':'Now this page is draft', 'status':'draft'}
body_test4_user = {'username':'robot_user', 'email':'robot@gmail.com', 'password':'robot', 'roles': ['subscriber']}
body_test4_post = {'title':'Page from robot', 'content':'This page is has password', 'status':'publish', 'password':'admin123'}
body_test5_post = {'title':'Robot page','content':'Without comments!', 'status':'publish', 'comment_status':'closed'}
body_test5_put = {'title':'Page with comments','content':'Welcome comments', 'status':'publish', 'comment_status':'open'}
body_test6_post = {'title':'New page','content':'This page does not allow comments', 'status':'publish', 'comment_status':'closed'}
body_parent1 = {'title':'Robot page','content':'Welcome to the robot page', 'status':'publish'}
body_child11 = {'title':'New robot title','content':'This page was created by robot', 'status':'publish'}
body_child12 = {'title':'Hi from robot','content':'Hello from robot', 'status':'publish'}
body_parent2 = {'title':'Robot page!','content':'Welcome to the new page', 'status':'publish'}
body_child21 = {'title':'Robot page','content':'Page to delete', 'status':'publish'}
body_child22 = {'title':'New robot title','content':'This page was created by robot', 'status':'publish'}
body_test4_put = {'title':'Page from robot', 'content':'Without password', 'status':'publish', 'password':''}
remove_pass = {'content': {'rendered': '<p>Without password</p>\n','protected': False}}
body_test9_post = {}
body_test10_post = {'title':'Robot page','content':'Welcome to the new page','status':'publish'}
body_test10_put = {'title':'Robot page','content':'Page update!','status':'4343'}
body_test11_post = {'title':'New robot title','content':'Page to edit!', 'status':'publish'}
body_test11_put = {'title':'Update from robot!','content':'Page edited', 'status':'publish', 'parent':'wrong'}
body_test12_post = {'title':'New page','content':'This page does not allow comments', 'status':'publish', 'comment_status':'closed'}
body_test12_put = {'title':'Robot page!','content':'This page allows comments!', 'status':'draft', 'comment_status':'wrong'}
body_test13_post = {'title':'Robot page','content':'Welcome to the robot page', 'status':'publish'}
body_test13_put = {'title':'Page update!!','content':'Now this page is draft', 'status':'draft', 'featured_media':'image'}
body_test14_post = {'title':'','content':'This page was created by robot', 'status':'publish'}
body_slug = {'title':'New robot title','content':'This page was created by robot', 'status':'publish', 'slug':'friendly url'}
page_status = {'status':'trash'}
delete = {"deleted": True}
code = {'code': 'rest_invalid_param'}
delete_message = {'message': 'Invalid post ID.'}
ignore_list = ['password', ('guid','raw'),('title','raw'),('content','raw'), ('content','block_version'), ('excerpt','raw'), 'permalink_template','_links', 'generated_slug']
ignore_list_password = ['password', ('guid','raw'),('title','raw'),('content','raw'), ('content','block_version'), ('content','rendered'),('excerpt','raw'), ('excerpt','rendered'),'permalink_template','_links', 'generated_slug']
path_list_schema = 'wp_api/resources/data/schemas/pages/list_page.json'
path_create_schema = 'wp_api/resources/data/schemas/pages/create_page.json'
path_delete_schema = 'wp_api/resources/data/schemas/pages/delete_page.json'
path_update_schema = 'wp_api/resources/data/schemas/pages/update_page.json'

