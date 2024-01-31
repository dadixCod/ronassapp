import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../models/models.dart';

class MovieTrailerStack extends StatelessWidget {
  const MovieTrailerStack({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              "${ApiConstants.imagePath}${movie.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black45,
            ),
          ),
          Positioned(
            top: 50,
            bottom: 50,
            left: 150,
            right: 150,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF243C5E).withOpacity(0.8),
                  border: Border.all(
                    color: Colors.white.withAlpha(100),
                    width: 1.5,
                  )),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 45,
              ),
            ),
          )
        ],
      ),
    );
  }
}
