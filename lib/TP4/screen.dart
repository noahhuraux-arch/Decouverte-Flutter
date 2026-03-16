import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'user_service.dart';
import 'user_provider.dart';
import 'item_screen.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildUI3(context);
  }

  Widget _buildUI1() {
    return FutureBuilder<User>(
      future: UserService.load(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!;
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text(user.address.city),
          );
        }

        if (snapshot.hasError) {
          return const Text("ERROR");
        }

        return _buildLoadingView();
      },
    );
  }

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildUI2(BuildContext context) {
    final provider = context.watch<UserProvider>();

    if (provider.isLoading) {
      return _buildLoadingView();
    }

    if (provider.users.isEmpty) {
      return const Center(child: Text("Aucun utilisateur"));
    }

    final user = provider.users.first;

    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Text(user.address.city),
    );
  }

  Widget _buildUI3(BuildContext context) {
    final provider = context.watch<UserProvider>();
    if (provider.isLoading) {
      return _buildLoadingView();
    }

    return _buildListView(provider.users);
  }

  Widget _buildListView(List<User> list) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final user = list[index];

        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: Text(user.address.city),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemScreen(user),
              ),
            );
          },
        );
      },
    );
  }
}
