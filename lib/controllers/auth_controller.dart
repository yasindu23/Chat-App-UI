import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seacre_t/constants/api_consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seacre_t/models/user_model.dart';
import 'package:seacre_t/providers/auth_provider.dart';
import 'dart:developer' as console;
import 'package:shared_preferences/shared_preferences.dart';

void signUp(
  String username,
  String displayName,
  String password,
  BuildContext context,
  WidgetRef ref,
) async {
  try {
    if (username.isEmpty || displayName.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'All the Fields are required',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final uri = Uri.parse('${baseApi}auth/signup');
    final response = await http.post(
      uri,
      body: {
        'username': username,
        'password': password,
        'displayName': displayName,
      },
    );

    if (response.statusCode == 200) {
      final userData = json.decode(response.body)['data'];
      final user = User.fromJson(userData);

      final pref = await SharedPreferences.getInstance();
      pref.setString('user', user.toJson().toString());

      ref
          .read(userProvider.notifier)
          .update(
            (state) => state.copyWith(
              displayName: user.displayName,
              id: user.id,
              invites: user.invites,
              joinedDate: user.joinedDate,
              joinedRooms: user.joinedRooms,
              profilePic: user.profilePic,
            ),
          );

      console.log(ref.read(userProvider).username);
    }
  } catch (e) {
    console.log(e.toString());
  }
}
