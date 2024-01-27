import 'package:flutter/material.dart';
import 'package:ronasapp/models/models.dart';

class Directors with ChangeNotifier{
  final List<Director> _directors =[
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
  List<Director> get directors => _directors;



}