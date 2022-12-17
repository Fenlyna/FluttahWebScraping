import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight * 2, horizontal: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: const NetworkImage(
                    'https://source.unsplash.com/random/200x200?men+portrait',
                  ))),
          const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 6.0),
              child: Text(
                'John Dhoe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Text(
            'Graphic Designer',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 30,
          ),
          listTile('My Membership', Icons.star_border_outlined),
          const Divider(),
          Consumer<CollectionController>(
            builder: (context, value, child) {
              return listTile('My Collection (${value.myCollection.length})',
                  Icons.bookmark_outline);
            },
          ),
          const Divider(),
          Consumer<CollectionController>(
            builder: (context, value, child) {
              return listTile('My Likes (${value.myEmojis.length})',
                  Icons.emoji_emotions_outlined);
            },
          ),
          const Divider(),
          listTile('Logout', Icons.logout, color: Colors.red),
        ],
      ),
    );
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
