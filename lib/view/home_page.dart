import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:individual_assignment/controller/archive_controller.dart';
import 'package:individual_assignment/controller/danbooru_controller.dart';
import 'package:individual_assignment/model/archive/game_list.dart';
import 'package:individual_assignment/model/danbooru/post.dart';
import 'package:individual_assignment/model/danbooru/search.dart';
import 'package:individual_assignment/view/search_danbooru.dart';

import '../controller/photo_controller.dart';
import '../model/data/photo_list.dart';
import 'photo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<DanbooruController>(
        context,
        listen: false,
      );
      controller.getPosts();
      controller.searchTerm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _selectedIndex == 0 ? mainBody() : searchBody(),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }

  Consumer mainBody() {
    return Consumer<DanbooruController>(builder: (context, value, child) {
      return RefreshIndicator(
        onRefresh: () async {
          return Provider.of<DanbooruController>(
            context,
            listen: false,
          ).getPosts();
        },
        child: ListView.builder(
          itemCount: value.posts.length,
          itemBuilder: (context, index) {
            Post post = value.posts[index];
            return PhotoCard(post: post);
          },
        ),
      );
    });
  }

  Consumer searchBody() {
    return Consumer<DanbooruController>(builder: (context, value, child) {
      return RefreshIndicator(
        onRefresh: () async {
          return Provider.of<DanbooruController>(
            context,
            listen: false,
          ).searchTerm();
        },
        child: ListView.builder(
          itemCount: value.searches.length,
          itemBuilder: (context, index) {
            Search search = value.searches[index];
            return SearchResult(
              search: search,
            );
          },
        ),
      );
    });
  }
}
