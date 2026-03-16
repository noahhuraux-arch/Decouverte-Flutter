import 'package:flutter/material.dart';
import 'user.dart';
import 'user_service.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await UserService.fetchUsers();
    } catch (e) {
      _users = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
