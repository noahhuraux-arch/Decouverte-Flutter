import 'package:flutter/material.dart';

import 'screen.dart';

void main() {
  runApp(const TP4App());
}

class TP4App extends StatelessWidget {
  const TP4App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const TP4(),
    );
  }
}

class TP4 extends StatelessWidget {
  const TP4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP4"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Screen(),
    );
  }
}