import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/invitation_tile.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(20),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.search_rounded),
                ),
                hintText: 'Search invites by room name',
                hintStyle: TextStyle(color: Color.fromARGB(255, 133, 133, 133)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFF141414),
              ),
            ),
          ),
          const Gap(20),
          InvitationTile(),
        ],
      ),
    );
  }
}
