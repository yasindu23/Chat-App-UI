import 'package:flutter/material.dart';

class CustomRoomDetailsBtn extends StatelessWidget {
  const CustomRoomDetailsBtn({
    super.key,
    required this.btnName,
    required this.process,
    required this.icon,
  });

  final String btnName;
  final Function() process;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 22, 22, 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ), // Change 10 to your desired radius
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ), // Optional: adjust padding
        ),
        onPressed: process,
        icon: Icon(icon, color: Color(0xFFDF436F)),
        label: Text(btnName, style: TextStyle(color: Color(0xFFDF436F))),
      ),
    );
  }
}