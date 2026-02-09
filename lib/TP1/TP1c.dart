import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TP1c extends StatefulWidget {
  @override
  _TP1cState createState() => _TP1cState();
}

class _TP1cState extends State<TP1c> {
  final _controller = TextEditingController();
  List<String> _list = <String>[];
  bool _isOk = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPrefsButtons(),
            _buildTextField(),
            const SizedBox(height: 8),
            _buildOkButton(),
            Expanded(
                child: _buildListView()
            ),
          ],
        )
    );
  }

  Widget _buildPrefsButtons() {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(style: buttonStyle, onPressed: _loadPrefs, child: Text('Load')),
        ElevatedButton(style: buttonStyle, onPressed: _savePrefs, child: Text('Save')),
        ElevatedButton(style: buttonStyle, onPressed: _onClear, child: Text('Clear')),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _list.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_list[i]),
            onTap: () => _onTapItem(_list[i]),
          );
        }
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: TextField(
        controller: _controller,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        onChanged: _onTextChanged,
      ),
    );
  }

  Widget _buildOkButton() {
    return ElevatedButton(
        onPressed: _isOk ? _onPressed : null,
        child: Text('OK')
    );
  }

  void _onClear() {
    setState(() {
      _list.clear();
    });
  }

  void _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("list", _list);
  }

  void _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _list = prefs.getStringList("list") ?? <String>[];
    });
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