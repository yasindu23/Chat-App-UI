import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/notification_tile.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  void showDeleteNotificationDialog(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_rounded, color: Colors.white, size: 27),
        ),
        actions: [
          Icon(Icons.notifications_rounded, color: Colors.white),
          Gap(15),
        ],
      ),
      body: ListView(
        children: [
          const Divider(height: 1, color: Color(0xFF353535)),
          ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            separatorBuilder:
                (context, index) =>
                    const Divider(height: 1, color: Color(0xFF353535)),
            itemBuilder: (context, index) => NotificationTile(),
          ),
          const Divider(height: 1, color: Color(0xFF353535)),
        ],
      ),
    );
  }
}
