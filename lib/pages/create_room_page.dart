import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/dialogs/create_room_dialog.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  void createRoomModel(BuildContext context) {
    showDialog(context: context, builder: (context) => CreateRoomDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                createRoomModel(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 41, 41, 41),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(15),
            Text(
              'Create your own Room',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
