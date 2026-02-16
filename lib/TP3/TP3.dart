import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_view_model.dart';
import 'screen.dart';

class TP3App extends StatelessWidget {
  const TP3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TP3(),
    );
  }
}

class TP3 extends StatelessWidget {
  const TP3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP3 - Calculatrice"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ChangeNotifierProvider(
        create: (context) => CalcViewModel(),
        child: const Screen(),
      ),
    );
  }
}
