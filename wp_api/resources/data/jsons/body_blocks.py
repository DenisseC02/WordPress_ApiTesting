create_block_schema = r'C:\Users\Roger\Documents\jalasoft\API_Testing\WordPress_ApiTesting\wp_api\resources\data\schemas\create_block_schema.json'
read_block_schema = r'C:\Users\Roger\Documents\jalasoft\API_Testing\WordPress_ApiTesting\wp_api\resources\data\schemas\read_block_schema.json'
body_wrong = {'sta': 'publish'}
body_create =  {
                'title': 'My Block rogerpp',
                'content': '[my-blockpp]',
                'status': 'publish',
                'my-block': {
                    'title': 'My Block Title',
                    'text': 'This is my block text.',
                    'alignment': 'center',
                    'size': 30,
                    'isBold': False,
                    'backgroundColor': '#ffffff',
                    'textColor': '#000000',
                    }
                }
body_update = {
                'title': 'My Block edited',
                'content': '[my-block edited]',
                'status': 'publish'
                }