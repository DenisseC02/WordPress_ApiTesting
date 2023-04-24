

class BodyGenerator():
    def block_body(self, type):
        if type == 'Valid' or type == 'valid':
            valid_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'publish','password': '12345678'}
            return valid_block
        if type == 'Draft' or type == 'draft':
            draft_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'draft','password': '12345678'}
            return draft_block
        if type == 'Private' or type == 'private':
            private_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'private','password': '12345678'}
            return private_block
        if type == 'Pending' or type == 'pending':
            pending_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'pending','password': '12345678'}
            return pending_block
        if type == 'Future' or type == 'future':
            future_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'future','password': '12345678'}
            return future_block
        if type == 'empty' or type == 'Empty':
            return {}
        if type == 'status' or type == 'Status':
            return {'status': 'publish'}
        if type == 'date' or type == 'Date':
            return {'date': '2022-04-24T16:48:33'}
        if type == 'slug' or type == 'Slug':
            return {'slug': 'edited slug'}
        if type == 'password' or type == 'Password':
            return {'password': 'new password'}
    def data_generator(self, type):
        if type == 'invalid status' or type == 'Invalid Status':
            return {'status': 'wodjcshsj'}, 400
        if type == 'invalid date' or type == 'Invalid Date':
            return {'date': 'wodjcshsj'}, 400
        if type == 'invalid date_gmt' or type == 'Invalid Date_gmt':
            return {'date_gmt': 'wodjcshsj'}, 400
