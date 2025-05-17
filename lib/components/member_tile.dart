import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  const MemberTile({super.key, required this.icon, required this.process});

  final IconData icon;
  final Function() process;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0, color: Color(0xFF353535)),
        ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/206174474?v=4',
            ),
          ),
          title: Text('Keyura Sithika', style: TextStyle(color: Colors.white)),
          subtitle: Text('keyura_01'),
          trailing: GestureDetector(
            onTap: process,
            child: Icon(icon, color: Colors.white),
          ),
        ),
        const Divider(height: 0, color: Color(0xFF353535)),
      ],
    );
  }
}
