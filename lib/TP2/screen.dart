import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model.dart';
import 'welcome.dart';

class Screen extends StatelessWidget {
  Screen({super.key});

  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();

  void _updateFormProgress(ViewModel model) {
    int count = 0;

    if (_firstname.text.isNotEmpty) count++;
    if (_lastname.text.isNotEmpty) count++;
    if (_email.text.isNotEmpty) count++;

    model.setProgress(count);
  }

  void _showWelcomeScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ViewModel>();

    return Form(
      onChanged: () => _updateFormProgress(model),
      child: Column(
        children: [
          Text("Inscription",
              style: Theme.of(context).textTheme.headlineMedium),

          LinearProgressIndicator(
            value: model.percent,
            color: Colors.orange,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstname,
              decoration: const InputDecoration(hintText: "Prénom"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastname,
              decoration: const InputDecoration(hintText: "Nom"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _email,
              decoration: const InputDecoration(hintText: "Email"),
            ),
          ),

          TextButton(
            onPressed: model.isOk
                ? () => _showWelcomeScreen(context)
                : null,
            child: const Text(
              "S'inscrire",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
