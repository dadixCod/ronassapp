// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/foundation.dart';
import 'package:ronasapp/models/models.dart';

@immutable
class Movie {
  final int id;
  final String title;
  final List<int> genres;
  final double voteAverage;
  final String posterPath;
  final String overview;
  final String releaseDate;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.genres,
    required this.voteAverage,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    this.isFavorite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '00',
      title: json['title'] ?? 'nothing',
      genres: json['genres'] ?? [0, 0],
      voteAverage: json['vote_average'] ?? 0.0,
      posterPath: json['poster_path'] ?? 'nothing',
      overview: json['overview'] ?? 'nothing',
      releaseDate: json['release_date'] ?? '0000-00-00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "genres": genres,
      "vote_average": voteAverage,
      "poster_path": posterPath,
      "overview": overview,
      "release_date": releaseDate,
    };
  }
}
