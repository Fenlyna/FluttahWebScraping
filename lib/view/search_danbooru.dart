// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_assignment/model/danbooru/search.dart';

class SearchResult extends StatelessWidget {
  final Search search;
  const SearchResult({
    Key? key,
    required this.search,
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
        search.label ?? '',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        search.post_count.toString(),
      ),
    );
  }
}
