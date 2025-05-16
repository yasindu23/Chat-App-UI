import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InvitationTile extends StatelessWidget {
  const InvitationTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
          Container(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              'From yasindu10',
              style: TextStyle(color: Color(0xFFB8B8B8)),
            ),
          ),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 56, 56, 56),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 18,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_rounded,
                          color: Color(0xFF4CDA87),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      width: 50,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 56, 56, 56),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 18,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Color(0xFFDF436F),
                        ),
                      ),
                    ),
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
