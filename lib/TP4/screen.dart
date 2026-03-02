import 'package:flutter/cupertino.dart';
import 'package:intro_flutter/TP4/user.dart';
import 'package:intro_flutter/TP4/user_service.dart';

class Screen {
  Widget _buildUI1() {
    return FutureBuilder<User>(
        future: UserService.load(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;

          }
          if (snapshot.hasError)
            return Text("ERROR");
          return _buildLoadingView();
        }
    );
  }
}