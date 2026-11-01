import 'package:flutter/material.dart';
import 'package:tugas5mobile/homepage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'warung makan rendi',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}