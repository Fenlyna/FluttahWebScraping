class Post {
  int? id;
  String? tag_string;
  String? file_url;

  Post({
    required this.id,
    required this.tag_string,
    required this.file_url,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag_string = json['tag_string'];
    file_url = json['file_url'];
  }
}
