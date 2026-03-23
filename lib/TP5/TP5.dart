import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TP5/screen.dart';
import 'movie_view_model.dart';

class TP5App extends StatelessWidget {
  const TP5App();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Films"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ChangeNotifierProvider(
            key: UniqueKey(),
            create: (context) => MovieViewModel()..loadDatasDefault(),
            child: Screen()
        ),
      ),
    );
  }
}