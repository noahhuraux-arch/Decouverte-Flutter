import '../TP2/screen.dart';
import 'user_service.dart';
import 'user.dart';

class TP4App extends Screen {
  const TP4App({super.key});

  @override
  void build() async {
    User user = await UserService.load();

    print("Utilisateur chargé :");
    print("Nom : ${user.name}");
    print("Email : ${user.email}");
    print("Ville : ${user.address.city}");
  }
}

