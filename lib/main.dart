import 'package:flutter/material.dart';
import 'package:seacre_t/pages/sign_in_page.dart';
import 'package:seacre_t/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1E),
      ),
      home: const SignInPage(),
    );
  }
}
