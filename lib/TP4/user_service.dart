import 'address.dart';
import 'user.dart';

class UserService {
  static Future<User> load() async {
    return Future.delayed(Duration(milliseconds: 500), () {
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
}
