import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcViewModel extends ChangeNotifier {
  String _expression = "";
  String _result = "";

  String get expression => _expression;
  String get result => _result;

  static bool isOp(String value) {
    return value == '/' || value == '*' || value == '+' || value == '-';
  }

  void addInput(String value) {
    _result += value;
    notifyListeners();
  }

  void clear() {
    _expression = "";
    _result = "";
    notifyListeners();
  }

  void removeLast() {
    if (_result.isNotEmpty) {
      _result = _result.substring(0, _result.length - 1);
      notifyListeners();
    }
  }

  void addOperator(String op) {
    if (_result.isEmpty && _expression.isEmpty) {
      return;
    }

    if (_expression.isNotEmpty &&
        isOp(_expression[_expression.length - 1]) &&
        _result.isEmpty) {
      return;
    }

    if (_result.isNotEmpty) {
      _expression += _result;
      _result = "";
    }

    _expression += op;
    notifyListeners();
  }

  void evaluate() {
    _expression += _result;
    try {
      final exp = Parser().parse(_expression);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      _result = eval.toString();
      _expression = _result;
    } catch (e) {
      _result = "Error";
    }
    notifyListeners();
  }
}
