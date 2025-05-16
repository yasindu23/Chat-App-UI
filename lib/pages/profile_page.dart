import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, String>> profileData = [
    {'title': 'User Name', 'data': 'yasindu10'},
    {'title': 'Own Rooms', 'data': '10'},
    {'title': 'Joined Rooms', 'data': '20'},
    {'title': 'Joined', 'data': '10 Oct 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/206174474?v=4',
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yasindu Samarasinghe',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  const Gap(3),
                ],
              ),
              subtitle: SizedBox(
                height: 28,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Change 12 to your preferred radius
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Change Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          const Divider(height: 0, color: Color(0xFF353535)),
          ListTile(
            title: Text('Display Name'),
            subtitle: Text('Yasindu Samarasinghe'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit_rounded),
            ),
          ),
          const Divider(height: 0, color: Color(0xFF353535)),
          ListView.builder(
            itemCount: profileData.length,
            shrinkWrap: true,
            itemBuilder:
                (context, index) => ProfileTile(
                  title: profileData[index]['title'].toString(),
                  trailing: profileData[index]['data'].toString(),
                ),
          ),
          const Divider(height: 0, color: Color(0xFF353535)),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            trailing: Icon(Icons.settings_rounded),
          ),
          const Divider(height: 0, color: Color(0xFF353535)),
        ],
      ),
    );
  }
}
