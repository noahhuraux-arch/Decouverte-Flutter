import 'package:flutter/material.dart';
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