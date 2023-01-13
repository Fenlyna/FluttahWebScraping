import 'package:flutter/material.dart';

import '../model/data/photo_list.dart';
import '../model/repository.dart';

class PhotoController extends ChangeNotifier {
  final List<Photo> _photos = [];
  bool _isLoading = false;

  List<Photo> get photos => _photos;
  bool get isLoading => _isLoading;

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  fetchData({int page=1}) async {
    photos.clear();
    setLoading(true);
    final photoRepository = PhotoRepository();
    photos.addAll(await photoRepository.photos(page: page));
    setLoading(false);
    notifyListeners();
  }
}
