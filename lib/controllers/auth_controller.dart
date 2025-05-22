import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seacre_t/constants/api_consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seacre_t/models/user_model.dart';
import 'package:seacre_t/providers/auth_provider.dart';
import 'package:seacre_t/utils/warning_alerts.dart';
import 'dart:developer' as console;
import 'package:shared_preferences/shared_preferences.dart';

void checkIsActive(WidgetRef ref) async {
  final pref = await SharedPreferences.getInstance();
  final userString = pref.getString('user');

  console.log(userString.toString());

  if (userString != null) {
    final userMap = json.decode(userString) as Map<String, dynamic>;
    final user = User.fromJson(userMap);

    ref.read(userProvider.notifier).update((state) => user);
  }
}

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
      User user = User.fromJson(userData);

      final pref = await SharedPreferences.getInstance();
      await pref.setString('user', json.encode(user.toJson()));

      ref.read(userProvider.notifier).update((state) => user);
      console.log('user created ${user.toJson()}');
    }
  } catch (e) {
    showScaffoldErrorMessage(context, e.toString());
  }
}

void signIn({
  required String username,
  required String password,
  required BuildContext context,
}) async {
  if (username.isEmpty || password.isEmpty) {
    return showScaffoldErrorMessage(
      context,
      'Please Enter username and password',
    );
  }

  final uri = Uri.parse('${baseApi}auth/signin');
  final response = await http.post(
    uri,
    body: {'username': username, 'password': password},
  );


}
