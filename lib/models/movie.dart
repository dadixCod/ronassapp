// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Movie {

  final String name;
  final List<String> category;
  final int minutes;
  final double rating;
  final String path;
  final String publishingYear;
  final String description;
  final int episodesNumber;
  final int seasons;
  bool isFavorite;

  Movie({
  
    required this.name,
    required this.category,
    required this.minutes,
    required this.rating,
    required this.path,
    required this.publishingYear,
    required this.description,
    required this.episodesNumber,
    required this.seasons,
    this.isFavorite = false,
  });

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        listEquals(other.category, category) &&
        other.minutes == minutes &&
        other.rating == rating &&
        other.path == path &&
        other.publishingYear == publishingYear &&
        other.description == description &&
        other.episodesNumber == episodesNumber &&
        other.seasons == seasons &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        minutes.hashCode ^
        rating.hashCode ^
        path.hashCode ^
        publishingYear.hashCode ^
        description.hashCode ^
        episodesNumber.hashCode ^
        seasons.hashCode ^
        isFavorite.hashCode;
  }
}
