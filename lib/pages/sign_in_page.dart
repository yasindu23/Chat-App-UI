import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seacre_t/controllers/auth_controller.dart';
import 'package:seacre_t/pages/sign_up_page.dart';
import 'package:seacre_t/utils/input_custom_decorations.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _username;
  late TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
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
                const Gap(150),
                Text('Sign In', style: TextStyle(fontSize: 30)),
                const Gap(25),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome back! ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Please sign in to\ncontinue to your account',
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
                  controller: _password,
                  decoration: mainInputDecoration('Enter your password'),
                ),
                const Gap(25),
                SizedBox(
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
                      signIn(
                        username: _username.text,
                        password: _password.text,
                        context: context,
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
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
              'Not registered yet?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const Gap(5),
            GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Color(0xFF1AD1E5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
