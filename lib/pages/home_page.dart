import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/room_tile.dart';
import 'package:seacre_t/utils/input_custom_decorations.dart';

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
            child: TextField(decoration: searchInputDecoration('Search Rooms')),
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
