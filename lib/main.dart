import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Vault',
      theme: ThemeData.dark(),
      home: const Scaffold(
        backgroundColor: Color(0xFF101820),
        body: Center(
          child: Text(
            'Welcome to Calculator Vault',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
