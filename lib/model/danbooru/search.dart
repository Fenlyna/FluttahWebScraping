class Search {
  String? label;
  int? post_count;

  Search({
    required this.label,
    required this.post_count,
  });

  Search.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    post_count = json['post_count'];
  }
}
