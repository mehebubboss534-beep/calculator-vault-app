
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
      home: const CalculatorVault(),
    );
  }
}

class CalculatorVault extends StatefulWidget {
  const CalculatorVault({super.key});

  @override
  State<CalculatorVault> createState() => _CalculatorVaultState();
}

class _CalculatorVaultState extends State<CalculatorVault> {
  String display = '0';

  void press(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
      } else if (value == '=') {
        try {
          final result = double.parse(display);
          display = result.toString();
        } catch (_) {
          display = 'Error';
        }
      } else {
        display = display == '0' ? value : display + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        title: const Text('Calculator Vault'),
        backgroundColor: const Color(0xFF172A3A),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                display,
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Welcome to Calculator Vault',
              style: TextStyle(color: Colors.greenAccent),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              '7', '8', '9', '/',
              '4', '5', '6', '*',
              '1', '2', '3', '-',
              'C', '0', '=', '+',
            ].map((key) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () => press(key),
                  child: Text(
                    key,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
