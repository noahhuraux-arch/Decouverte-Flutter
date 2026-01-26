import 'package:flutter/material.dart';
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
      body: TP1b(
          )
    );
  }
}

class TP1a extends StatefulWidget {
  @override
  _TP1aState createState() => _TP1aState();
}
class _TP1aState extends State<TP1a> {
  String _text = "A cliquer";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text, style: TextStyle(fontSize: 28),),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: onPressed, child: Text('Click')),
          ],
        )
    );
  }
  void onPressed() {
    setState(() {
      _text = "Clic";
    });
  }
}

class TP1b extends StatefulWidget {
  @override
  _TP1bState createState() => _TP1bState();
}
class _TP1bState extends State<TP1b> {
   int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("A cliquer : $_counter", style: TextStyle(fontSize: 28),),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: onPressed, child: Text('Click')),
          ],
        )
    );
  }
  void onPressed() {
    setState(() {
      _counter++;
    });
  }
}