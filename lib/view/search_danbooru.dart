import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_assignment/model/archive/game_list.dart';

class SearchResult extends StatelessWidget {
  final GameList gamelist;
  const SearchResult({
    Key? key,
    required this.gamelist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(Icons.search),
      title: Text(
        gamelist.name ?? '',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        gamelist.size.toString(),
      ),
    );
  }
}
