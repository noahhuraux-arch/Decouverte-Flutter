import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen.dart';
import 'user_provider.dart';

class TP4App extends StatelessWidget {
  const TP4App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      key: UniqueKey(),
      create: (context) => UserProvider()..loadUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: Screen(),
        ),
      ),
    );
  }
}
