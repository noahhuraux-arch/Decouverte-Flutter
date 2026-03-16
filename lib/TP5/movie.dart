enum MovieType {
  drama,
  western,
  sciFi,
  thriller,
  animation,
  aventure,
  comedy,
  horror;
}

class Movie {
  final int id;
  final String title;
  final int year;
  final String maker;
  final MovieType type;

  const Movie({
  required this.id,
    required this.title,
    required this.year,
    required this.maker,
    required this.type
  });
}