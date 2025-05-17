import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  const MemberTile({super.key});

  void deleteMemberShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(bottom: 15, top: 10),
            titlePadding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            title: Text('Remove keyura01', style: TextStyle(fontSize: 17)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  width: double.infinity, // Full width of parent
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete_rounded, color: Color(0xFFDF436F)),
                    label: Text(
                      'Remove',
                      style: TextStyle(color: Color(0xFFDF436F)),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

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
            onTap: () => deleteMemberShowDialog(context),
            child: Icon(
              Icons.delete_rounded,
              color: const Color.fromARGB(190, 255, 82, 82),
            ),
          ),
        ),
        const Divider(height: 0, color: Color(0xFF353535)),
      ],
    );
  }
}
