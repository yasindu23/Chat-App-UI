import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  const RoomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
