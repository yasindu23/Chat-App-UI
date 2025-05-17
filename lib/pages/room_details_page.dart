import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/components/member_tile.dart';
import 'package:seacre_t/utils/custom_buttons.dart';

class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({super.key});

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollText = false;
  bool _isAdmin = true;

  void showAddMemberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 10,
            ),
            title: Text('Add Member', style: TextStyle(fontSize: 18)),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search Bar
                  Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Icon(Icons.search_rounded),
                        ),
                        hintText: 'Search Members',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 133, 133, 133),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFF141414),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // List of members
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => MemberTile(
                            icon: Icons.add_rounded,
                            process: () {},
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void deleteMemberShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(bottom: 15, top: 10),
            titlePadding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            title: Text('Remove keyura01', style: TextStyle(fontSize: 17)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  width: double.infinity, // Full width of parent
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete_rounded, color: Color(0xFFDF436F)),
                    label: Text(
                      'Remove',
                      style: TextStyle(color: Color(0xFFDF436F)),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset > 50 && !_showScrollText) {
      setState(() {
        _showScrollText = true;
      });
    } else if (_scrollController.offset <= 50 && _showScrollText) {
      setState(() {
        _showScrollText = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            _showScrollText
                ? Text(
                  'Room Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
                : null,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_rounded, color: Colors.white, size: 27),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/206174474?v=4",
                ),
                maxRadius: 45,
              ),
            ),
            const Gap(15),
            Text(
              'Room Name',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            const Divider(height: 0, color: Color(0xFF353535)),
            ListTile(
              title: Text(
                'Admin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              trailing: Text('yasindu10', style: TextStyle(fontSize: 14)),
            ),
            const Divider(height: 0, color: Color(0xFF353535)),
            const Gap(3),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Text(
                'A peaceful hill town surrounded by tea plantations and misty mountains, Ella is perfect for hiking and unwinding in nature’s beauty.Would you like a two-line description for a different place or topic?',
              ),
            ),
            const Gap(3),
            const Divider(height: 0, color: Color(0xFF353535)),
            const Gap(20),
            //////////// Admin / member views
            _isAdmin
                ? Column(
                  children: [
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          prefixIcon: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(Icons.search_rounded),
                          ),
                          hintText: 'Search Members',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFF141414),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12 Members'),
                          GestureDetector(
                            onTap: () => showAddMemberDialog(context),
                            child: Icon(Icons.add_rounded),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MemberTile(
                          icon: Icons.delete_rounded,
                          process: () {
                            deleteMemberShowDialog(context);
                          },
                        );
                      },
                    ),
                    const Gap(20),
                  ],
                )
                : Container(),
            _isAdmin
                ? CustomRoomDetailsBtn(
                  btnName: 'Deactivate Room',
                  process: () {},
                  icon: Icons.delete_rounded,
                )
                : Container(),
            const Gap(11),
            CustomRoomDetailsBtn(
              btnName: 'Report Room',
              process: () {},
              icon: Icons.info_rounded,
            ),
            const Gap(11),
            CustomRoomDetailsBtn(
              btnName: 'Leave Room',
              process: () {},
              icon: FontAwesomeIcons.rightFromBracket,
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
