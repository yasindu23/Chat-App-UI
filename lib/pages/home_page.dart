import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/room_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                hintText: 'Search Rooms',
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
          const Divider(height: 0, color: Color(0xFF353535)),
          ListView.separated(
            separatorBuilder:
                (context, index) =>
                    const Divider(height: 0, color: Color(0xFF353535)),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => RoomTile(),
          ),
        ],
      ),
    );
  }
}
