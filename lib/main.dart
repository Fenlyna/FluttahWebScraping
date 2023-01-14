import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:individual_assignment/controller/archive_controller.dart';
import 'package:individual_assignment/controller/danbooru_controller.dart';
// import 'package:individual_assignment/controller/photo_controller.dart';

import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DanbooruController(),
      child: MaterialApp(
        title: 'PB',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Danbooru'),
      ),
    );
  }
}
