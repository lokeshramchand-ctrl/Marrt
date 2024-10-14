import 'package:flutter/material.dart';
import 'package:seko/intropage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Intropage(), // Your HomePage screen
      debugShowCheckedModeBanner: false,
    );
  }
}
