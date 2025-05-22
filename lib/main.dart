import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seacre_t/pages/page_controller.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Secret App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1B),
      ),
      home: ProviderScope(child: CustomPageController()),
    ),
  );
}
