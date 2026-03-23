import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'movie_view_model.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieViewModel>();
    if (model.isLoading) return _LoadingView();
    return _Content(model.movies);
  }
}