import 'package:flutter/material.dart';
import 'package:intro_flutter/TP2/view_model.dart';
import 'package:provider/provider.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  void _updateFormProgress(model) {
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ViewModel>();

    return Form(
      onChanged: () => _updateFormProgress(model),
      child: Column(
        children: [
          Text("Inscription", style: Theme.of(context).textTheme.headlineMedium),
          LinearProgressIndicator(
            value: 0.0,
            color: Colors.orange,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Prénom"),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("S'inscrire",
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}