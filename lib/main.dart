import 'package:flutter/material.dart';
import 'TP1a.dart';
import 'TP1b.dart';
import 'TP1c.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, this.title = ''}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: TP1c(
          )
    );
  }
}
