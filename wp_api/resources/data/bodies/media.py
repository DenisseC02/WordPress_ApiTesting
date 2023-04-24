ignore_list = [('guid', 'raw'), ('title', 'raw'), ('caption', 'raw'), ('description', 'raw'), 'permalink_template', 'generated_slug', 'missing_image_sizes', '_links']
path_to_schema = {
    'create': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/schemas/media/create_media.json',
    'get': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/schemas/media/get_media.json',
    'get_all': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/schemas/media/get_all_media.json',
    'update': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/schemas/media/update_media.json',
    'delete': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/schemas/media/delete_media.json'
}
not_found_media = {
    "code": "rest_post_invalid_id",
    "message": "Invalid post ID.",
    "data": {
        "status": 404
    }
}
not_found_message = {
    "message": "Invalid post ID."
}
image_files = {
    'image_01':'/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_sm-01.jpg',
    'image_02': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_ss-01.jpeg',
    'image_03': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_ss-01.png',
    'image_05': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_ss-02.jpg',
    'image_06': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_ss-03.jpg',
    'image_07': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/image_ss-04.jpg'
}
video_files = {
    'video_01': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/video_ss-01.mp4',
    'video_02': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/video_ss-02.mp4'
}
audio_files = {
    'audio_01': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/audio_s-02.mp3',
    'audio_02': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/audio_s-01.mp3'
}
other_files = {
    'file_01': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/big_file-01.pth',
    'file_02': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/deb_file_m-01.deb',
    'file_03': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/json_s-01.json',
    'file_04': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/pdf_m-01.pdf',
    'file_05': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/xml_l-01.xml',
    'file_06': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/zip_s-01.zip',
    'file_07': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/video_sm-02.mp4',
    'file_08': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/audio_m-01.mp3',
    'file_09': '/home/danisku/WordPress_ApiTesting/wp_api/resources/data/media/pdf_s-01.pdf'
}