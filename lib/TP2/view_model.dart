import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  int _progress = 0;

  int get progress => _progress; // nombre de champs remplis
  double get percent => _progress / 3; // valeur comprise entre 0 et 1

  bool get isOk => _progress == 3;

  void setProgress(int value) {
    _progress = value;
    notifyListeners();
  }
}