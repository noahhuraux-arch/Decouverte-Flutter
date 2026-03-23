import 'package:flutter/cupertino.dart';

import 'movie.dart';

class MovieViewModel extends ChangeNotifier {
  List<Movie> _movies = [];
  static const _defaultList = [
    Movie(title: "Les évadés", year: 1994, maker: "Frank Darabont", type: MovieType.drama, id: null),
    Movie(title: "Le bon, la brute et le truand", year: 1966, maker: "Sergio Leone", type: MovieType.western),
    Movie(title: "Matrix", year: 1999, maker: "Lana Wachowski", type:MovieType.sciFi),
    Movie(title: "Le silence des agneaux", year: 1991, maker: "Jonathan Demme",type: MovieType.thriller),
    Movie(title: "Le voyage de Chihiro", year: 2001, maker: "Hayao Miyazaki",type: MovieType.animation),
    Movie(title: "Les aventuriers de l’arche perdue", year: 1981, maker: "Steven Spielberg", type: MovieType.aventure),
    Movie(title: "Les temps modernes", year: 1936, maker: "Charlie Chaplin",type: MovieType.comedy),
    Movie(title: "Poltergeist", year: 1982, maker: "Tobe Hooper", type: MovieType.horror),
  ];

  Future loadDatasDefault() async {
    _movies = _defaultList;
    notifyListeners();
  }
}