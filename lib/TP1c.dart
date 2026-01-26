import 'package:flutter/material.dart';
class TP1c extends StatefulWidget {
  @override
  _TP1cState createState() => _TP1cState();
}

class _TP1cState extends State<TP1c> {
  final _controller = TextEditingController();
  bool _isOk = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: TextField(
                controller: _controller,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                onChanged: _onTextChanged,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _isOk ? _onPressed : null, child: Text('OK')),
          ],
        )
    );
  }
  void _onTextChanged(
      String text
      ) {
  }
  void _onPressed() {
  }
}
