import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'user.dart';

class ItemScreen extends StatelessWidget {
  final User user;

  const ItemScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom : ${user.name}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Email : ${user.email}"),
            const SizedBox(height: 10),
            Text("Username : ${user.username}"),
            const SizedBox(height: 20),
            const Text("Adresse :", style: TextStyle(fontSize: 18)),
            Text(user.address.street),
            Text(user.address.suite),
            Text("${user.address.city} ${user.address.zipcode}"),
          ],
        ),
      ),
    );
  }
}
