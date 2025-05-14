import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InvitationTile extends StatelessWidget {
  const InvitationTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: size.width,
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10),
          Text('From yasindu10', style: TextStyle(color: Color(0xFFB8B8B8))),
          ListTile(
            title: Text('Room Name'),
            subtitle: Text('12 Members'),
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/206174474?v=4',
              ),
            ),
            trailing: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
