import 'package:flutter/material.dart';
class TP1c extends StatefulWidget {
  @override
  _TP1cState createState() => _TP1cState();
}

class _TP1cState extends State<TP1c> {
  final _controller = TextEditingController();
  final _list = <String>[];
  bool _isOk = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: _buildListView()
            ),
            _buildTextField(),
            const SizedBox(height: 8),
            _buildOkButton(),
          ],
        )
    );
  }
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
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _list.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(_list[i]),
                      onTap: () => _onTapItem(_list[i]),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }

  void _onTextChanged(String text) {
    bool valid = text.length == 10 && int.tryParse(text) != null && text[0]=="0";

    setState(() {
      _isOk = valid;
    });
  }

  void _onPressed() {
    print(_controller.text);
    bool valid = true;
    for (int i = 0 ; i<_list.length; i++)
    {
      if (_list[i]==_controller.text)
      {
        valid = false;
      }
    }
    if (valid) {
      setState(() {
        _list.insert(0, _controller.text);
        _controller.text = "";
        _isOk = false;
      });
    }
    else
      {
        setState(() {
          _controller.text = "";
          _isOk = false;
        });
      }
  }

  void _onTapItem(String list) {
    setState(() {
      _controller.text=list;
    });
  }
}
