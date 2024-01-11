// ignore_for_file: public_member_api_docs, sort_constructors_first
class Director {
  final String name;
  final String path;
  final int? ratingStars;
  Director({
    required this.name,
    required this.path,
    required this.ratingStars,
  });
}

List<Director> directors = [
  Director(name: "Louis Leterrier", path: "assets/images/louis_leterrier.jpg",ratingStars: 4),
  Director(name: "David Fincher", path: "assets/images/david_fincher.jpg",ratingStars: 5),
  Director(name: "James Cameron", path: "assets/images/james_cameron.jpg",ratingStars: 3),
  Director(name: "Martin Scoresse", path: "assets/images/martin_scorsese.jpg",ratingStars: 4),
  Director(name: "Paul Thomas", path: "assets/images/paul_thomas.jpg",ratingStars: 4),
  Director(name: "Pedro Almodovar", path: "assets/images/pedro_almodovar.jpg",ratingStars: 5),
  Director(name: "Quentin Tarantino", path: "assets/images/quentin_tarantino.jpg",ratingStars: 5),
  Director(name: "Stanley Kubrick", path: "assets/images/stanley_kubrick.jpg",ratingStars: 4),
  Director(name: "Steven Spielberg", path: "assets/images/steven_spielberg.jpg",ratingStars: 3),
  Director(name: "Wes Anderson", path: "assets/images/wes_anderson.jpg",ratingStars: 3),
];
