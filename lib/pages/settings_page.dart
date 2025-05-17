import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDeveloperInfoShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_rounded, color: Colors.white, size: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////// Developer Info Section
            const Gap(15),
            const Divider(height: 0, color: Color(0xFF353535)),
            ListTile(
              onTap:
                  () => setState(() {
                    _isDeveloperInfoShow = !_isDeveloperInfoShow;
                  }),
              minVerticalPadding: 0,
              title: Text(
                'Developer Info',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing:
                  _isDeveloperInfoShow
                      ? FaIcon(FontAwesomeIcons.chevronUp, size: 15)
                      : FaIcon(FontAwesomeIcons.chevronDown, size: 15),
            ),
            //////////// toggle developer info
            _isDeveloperInfoShow
                ? Column(
                  children: [
                    ListTile(
                      horizontalTitleGap: 0,
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: CircleAvatar(
                          radius: 25,
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
                          const Gap(2),
                        ],
                      ),
                      subtitle: Text(
                        'Backend Developer | Mobile App Developer',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Gap(7),
                          Text(
                            "I'm Yasindu Samarasinghe, a professional full-stack mobile app developer with over 4 years of experience in developing modern, high-performance mobile applications. Currently, I'm freelancing on different platforms. If you want to develop your own mobile app or want to build a backend, please contact me.",
                          ),
                          const Gap(20),
                          Text(
                            'Contact me',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.linkedin),
                              const Gap(20),
                              FaIcon(FontAwesomeIcons.instagram),
                              const Gap(20),
                              FaIcon(FontAwesomeIcons.github),
                              const Gap(20),
                              FaIcon(FontAwesomeIcons.xTwitter),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                )
                : Container(),
            const Divider(height: 0, color: Color(0xFF353535)),
            const Gap(25),
            //////////// Account Deactivate Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 30,
              width: double.infinity, // Full width of parent
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDF436F),
                ),
                icon: Icon(Icons.info_rounded, color: Colors.white),
                label: Text(
                  'Deactivate Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
