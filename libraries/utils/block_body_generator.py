

class BodyGenerator():
    def block_body(self, type):
        if type == 'Valid' or type == 'valid':
            valid_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'publish','password': '12345678'}
            return valid_block
        if type == 'Draft' or type == 'draft':
            draft_block = {'title': 'My Block rogerpp','content': '[my-blockpp]','status': 'draft','password': '12345678'}
            return draft_block
        if type == 'empty' or type == 'Empty':
            return {}
        if type == 'invalid status' or type == 'Invalid Status':
            return {'status': 'wodjcshsj'}
    def data_generator(self, type):
        if type == 'invalid status' or type == 'Invalid Status':
            return {'status': 'wodjcshsj'}, 400
        if type == 'invalid date' or type == 'Invalid Date':
            return {'date': 'wodjcshsj'}, 400
        if type == 'invalid date_gmt' or type == 'Invalid Date_gmt':
            return {'date_gmt': 'wodjcshsj'}, 400