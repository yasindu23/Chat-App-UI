import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/controllers/auth_controller.dart';
import 'package:seacre_t/pages/sign_in_page.dart';
import 'package:seacre_t/utils/input_custom_decorations.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _username;
  late TextEditingController _displayName;
  late TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _displayName = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _displayName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(80),
                Text('Sign Up', style: TextStyle(fontSize: 30)),
                const Gap(25),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome! ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Please sign up to create your account and start chatting',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  textAlign:
                      TextAlign.center, // Optional: centers the whole block
                ),
                const Gap(30),
                ////////////////// User Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(5),
                    Text(
                      'User Name',
                      style: TextStyle(color: Colors.white, fontSize: 13.5),
                    ),
                  ],
                ),
                const Gap(4),
                TextField(
                  controller: _username,
                  decoration: mainInputDecoration('Enter your user name'),
                ),
                const Gap(5),
                Row(
                  children: [
                    const Gap(10),
                    Icon(Icons.info_rounded, size: 15),
                    const Gap(4),
                    Text(
                      "User name can't be changed later",
                      style: TextStyle(fontSize: 13.5),
                    ),
                  ],
                ),
                const Gap(20),
                ////////////////// Display Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(5),
                    Text(
                      'Display Name',
                      style: TextStyle(color: Colors.white, fontSize: 13.5),
                    ),
                  ],
                ),
                const Gap(4),
                TextField(
                  controller: _displayName,
                  decoration: mainInputDecoration('Enter your display name'),
                ),
                const Gap(20),
                ////////////////// Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(5),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.white, fontSize: 13.5),
                    ),
                  ],
                ),
                const Gap(4),
                TextField(
                  obscureText: true,
                  controller: _password,
                  decoration: mainInputDecoration('Enter your password'),
                ),
                const Gap(25),
                Consumer(
                  builder:
                      (context, ref, child) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3A519E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Decrease this for less rounded corners
                            ),
                          ),
                          onPressed: () {
                            signUp(
                              _username.text,
                              _displayName.text,
                              _password.text,
                              context,
                              ref,
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already created an account.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const Gap(5),
            GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  ),
              child: Text(
                'Sign In',
                style: TextStyle(color: Color(0xFF1AD1E5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
