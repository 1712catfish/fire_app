import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 200.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        // child: Image.asset('assets/yt_logo_dark.png'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                'https://i.pinimg.com/originals/3a/72/36/3a723682ae125412aaa05987c6fcd949.png',
                height: 40.0,
                width: 40.0,
              ),
            ),
            Text(
              'FIREAPP',
              style: TextStyle(fontSize: 25, fontFamily: 'Youtube'),
            )
          ],
        ),
      ),
      actions: [
        // IconButton(
        //   icon: const Icon(Icons.cast),
        //   onPressed: () {},
        // ),
        // IconButton(
        //   icon: const Icon(Icons.notifications_outlined),
        //   onPressed: () {},
        // ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 40.0,
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
