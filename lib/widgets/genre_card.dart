import 'package:flutter/material.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/utils/extensions.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    // Birds of Paradise
    // ToonyLine
    // VampireWars
    // gangOfThree
    String getFontFamily(String genreName) {
      switch (genreName) {
        case 'Action':
          return 'VampireWars';
        case 'Adventure':
          return 'gangOfThree';
        case 'Comedy':
          return 'Birds of Paradise';
        case 'Animation':
          return 'VampireWars';
        case 'Crime':
          return 'VampireWars';
        default:
          return 'Poppins';
      }
    }

    return Container(
      width: 180,
      height: 100,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          genre.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontFamily: getFontFamily(genre.name),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
