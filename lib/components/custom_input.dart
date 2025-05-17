import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.hintText,
    required this.process,
    required this.height,
  });

  final String hintText;
  final Function(String value) process;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        onSubmitted: (value) => process,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: hintText,
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
    );
  }
}
