import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_view_model.dart';
import 'button.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  final List<String> _textButtons = const [
    'C', 'B', '', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '+',
    '1', '2', '3', '-',
    '', '0', '', '=',
  ];

  bool _isOp(int idx) {
    final txt = _textButtons[idx];
    return CalcViewModel.isOp(txt);
  }

  Color _backColorForButton(int idx) {
    final txt = _textButtons[idx];
    if (txt == '=') {
      return Colors.orange;
    }
    if (_isOp(idx) || txt == 'C' || txt == 'B') {
      return Colors.black26;
    }
    return Colors.black12;
  }

  Color _colorForButton(int idx) {
    final txt = _textButtons[idx];
    if (_isOp(idx) || txt == '=' || txt == 'C' || txt == 'B') {
      return Colors.white;
    }
    return Colors.black;
  }

  Widget _buildText(CalcViewModel model) {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            model.expression,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 20, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            model.result,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 28, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _onPressed(CalcViewModel model, int index) {
    final txt = _textButtons[index];

    if (txt.isEmpty) return;

    if (txt == 'C') {
      model.clear();
      return;
    }

    if (txt == 'B') {
      model.removeLast();
      return;
    }

    if (txt == '=') {
      model.evaluate();
      return;
    }

    if (CalcViewModel.isOp(txt)) {
      model.addOperator(txt);
      return;
    }

    model.addInput(txt);
  }

  Widget _buildListItem(CalcViewModel model, int index) {
    final txt = _textButtons[index];

    if (txt.isEmpty) {
      return const SizedBox.shrink();
    }

    if (txt == 'B') {
      return Container(
        margin: const EdgeInsets.all(2),
        color: _backColorForButton(index),
        child: IconButton(
          onPressed: () => _onPressed(model, index),
          icon: const Icon(Icons.backspace, color:
          Colors.white),
        ),
      );
    }

    return Button(
      title: txt,
      backColor: _backColorForButton(index),
      color: _colorForButton(index),
      onPressed: () => _onPressed(model, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CalcViewModel>();

    return Column(
      children: [
        _buildText(model),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: _textButtons.length,
            itemBuilder: (context, index) => _buildListItem(model, index),
          ),
        ),
      ],
    );
  }
}
