import 'package:flutter/cupertino.dart';
import 'package:individual_assignment/model/danbooru/search.dart';

import '../model/danbooru/post.dart';
import '../model/danbooru_repository.dart';

class DanbooruController extends ChangeNotifier {
  final repository = DanbooruRepository();
  final List<Post> posts = [];
  final List<Search> searches = [];
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getPosts() async {
    posts.clear();
    setLoading(true);

    List<Post>? result = await repository.getPosts();

    if (result != null) {
      posts.addAll(result);
      notifyListeners();
    }

    setLoading(false);
  }

  searchTerm() async {
    searches.clear();
    setLoading(true);

    List<Search>? result = await repository.searchTerm();

    if (result != null) {
      searches.addAll(result);
      notifyListeners();
    }

    setLoading(false);
  }
}
