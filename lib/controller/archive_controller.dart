import 'package:flutter/cupertino.dart';
import 'package:individual_assignment/model/archive/game_list.dart';

import '../model/archive_repository.dart';

class ArchiveController extends ChangeNotifier {
  final repository = ArchiveRepository();
  final List<GameList> gamelists = [];
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getGamelists() async {
    gamelists.clear();
    setLoading(true);

    List<GameList>? result = await repository.getGamelists();

    if (result != null) {
      gamelists.addAll(result);
      notifyListeners();
    }

    setLoading(false);
  }
}
