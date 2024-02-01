import 'package:flutter/material.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/utils/extensions.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
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
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
