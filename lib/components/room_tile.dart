import 'package:flutter/material.dart';
import 'package:seacre_t/pages/chat_details_page.dart';

class RoomTile extends StatelessWidget {
  const RoomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatDetailsPage()),
          ),
      title: Text('Room Name'),
      subtitle: Text('Description for app'),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: NetworkImage(
          'https://avatars.githubusercontent.com/u/206174474?v=4',
        ),
      ),
      // trailing: Icon(Icons.stars_rounded),
    );
  }
}
