import 'package:flutter/material.dart';
import 'package:individual_assignment/model/danbooru/post.dart';

// import '../model/data/photo_list.dart';

class PhotoCard extends StatelessWidget {
  final Post post;
  const PhotoCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 8.0),
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.black12,
                      //     backgroundImage: NetworkImage(
                      //         photo.user?.profileImage?.medium ?? ''),
                      //   ),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          post.id.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.white,
                  //       elevation: 0,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12.0),
                  //           side: BorderSide(color: Colors.grey.shade300)),
                  //     ),
                  //     child: const Text(
                  //       'Follow',
                  //       style: TextStyle(color: Colors.black54),
                  //     ))
                ],
              ),
            ),
            Image.network(
              post.file_url ?? '',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Icon(
                      //   photo.likedByUser ?? false
                      //       ? Icons.emoji_emotions
                      //       : Icons.emoji_emotions_outlined,
                      //   color: photo.likedByUser ?? false
                      //       ? Colors.blue
                      //       : Colors.grey.shade800,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.bookmark_outline_rounded,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
