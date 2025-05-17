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

InputDecoration searchInputDecoration(String hintText) => InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 0),
  prefixIcon: Container(
    padding: const EdgeInsets.only(left: 10),
    child: Icon(Icons.search_rounded),
  ),
  hintText: hintText,
  hintStyle: TextStyle(color: Color.fromARGB(255, 133, 133, 133)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Color(0xFF141414),
);
