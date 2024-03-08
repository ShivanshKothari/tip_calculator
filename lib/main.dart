import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/screens/providers/tip_calculator_model.dart';
import 'package:tip_calculator/screens/tip_baba.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TipCalculatorModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipBaba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TipBaba(),
    );
  }
}
