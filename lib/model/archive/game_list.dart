class GameList {
  String? name;
  int? size;

  GameList({
    required this.name,
    required this.size,
  });

  GameList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
  }
}
