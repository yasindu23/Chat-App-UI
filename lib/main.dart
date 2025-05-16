import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:seacre_t/pages/home_page.dart';
import 'package:seacre_t/pages/invitation_page.dart';
import 'package:seacre_t/pages/profile_page.dart';
import 'package:seacre_t/pages/create_room_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Secret App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1B),
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    InvitationPage(),
    RoomsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        leading:
            _selectedIndex == 0
                ? Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 51, 51, 51),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.notifications_rounded),
                )
                : null,
        actions: [
          _selectedIndex != 3
              ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/206174474?v=4',
                  ),
                ),
              )
              : Container(),
        ],
        centerTitle: _selectedIndex == 0 ? true : false,
        title: Text(
          _selectedIndex == 0
              ? 'SecreT'
              : _selectedIndex == 1
              ? 'Invitations'
              : _selectedIndex == 2
              ? 'Room'
              : 'Profile',
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.surface,
        ),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: GNav(
          tabBackgroundColor: const Color(0xFF242424),
          gap: 8,
          padding: EdgeInsets.all(12),
          tabs: const [
            GButton(icon: Icons.home_rounded, text: 'Home'),
            GButton(icon: Icons.mail, text: 'Invitations', iconSize: 23.5),
            GButton(icon: Icons.add_box_rounded, text: 'Room'),
            GButton(icon: Icons.person_rounded, text: 'Profile'),
          ],
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
