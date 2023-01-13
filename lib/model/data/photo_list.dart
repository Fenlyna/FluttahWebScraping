import 'photo_url.dart';
import 'profile_image.dart';

class Photo {
  String? id;
  bool? likedByUser;
  String? description;
  User? user;
  Urls? urls;
  String? error;

  factory Photo.error({
    required String errorMessage,
  }) =>
      Photo(
        error: errorMessage,
      );

  Photo({
    this.id,
    this.likedByUser,
    this.description,
    this.user,
    this.urls,
    this.error,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    error = json['error'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['liked_by_user'] = likedByUser;
    data['description'] = description;
    data['error'] = error;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }

    return data;
  }
}


class User {
  String? id;
  String? username;
  String? name;
  ProfileImage? profileImage;

  User({
    this.id,
    this.username,
    this.name,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    return data;
  }
}
