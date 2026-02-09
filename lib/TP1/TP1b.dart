import 'package:flutter/material.dart';
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