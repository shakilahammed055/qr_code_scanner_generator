import 'package:flutter/material.dart';
import 'package:qr_code/homescreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Qr Code Scanner and Generator",
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
