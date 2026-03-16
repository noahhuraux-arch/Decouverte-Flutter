import 'dart:convert';
import 'package:http/http.dart';

import 'address.dart';
import 'user.dart';

class UserService {
  static Future<User> load() async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return const User(
        id: 0,
        name: 'Dupont',
        username: 'Pierre',
        email: 'pierre@dupont.fr',
        address: Address(
          street: '10, rue du chateau',
          suite: 'Appt 5',
          city: 'Reims',
          zipcode: '51100',
        ),
      );
    });
  }

  static Future<List<User>> fetchUsers() async {

    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'), headers:{'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map<User>((json) => User.fromJson(json))
          .toList();
    }

    throw Exception('Failed to load users');
  }
}
