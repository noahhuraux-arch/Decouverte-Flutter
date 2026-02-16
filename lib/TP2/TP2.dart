import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen.dart';
import 'view_model.dart';

class TP2App extends StatelessWidget {
  const TP2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TP2(),
    );
  }
}

class TP2 extends StatelessWidget {
  const TP2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP2"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ChangeNotifierProvider(
        create: (context) => ViewModel(),
        child: Screen(),
      ),
    );
  }
}