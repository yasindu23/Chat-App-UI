import 'package:flutter/material.dart';

InputDecoration mainInputDecoration(String hintText) => InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
  filled: true,
  fillColor: Color(0xFF141414),
  hintText: hintText,
  hintStyle: TextStyle(color: Color(0xFF6C6C6C), fontSize: 15),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(15),
  ),
);
