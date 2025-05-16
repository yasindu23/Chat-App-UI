import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.title, required this.trailing});

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0, color: Color(0xFF353535)),
        ListTile(
          title: Text(
            title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          trailing: Text(trailing.toString(), style: TextStyle(fontSize: 14)),
        ),
        const Divider(height: 0, color: Color(0xFF353535)),
      ],
    );
  }
}
