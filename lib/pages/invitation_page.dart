import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/invitation_tile.dart';
import 'package:seacre_t/utils/input_custom_decorations.dart';

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
              decoration: searchInputDecoration('Search invites by room name'),
            ),
          ),
          const Gap(20),
          InvitationTile(),
        ],
      ),
    );
  }
}
