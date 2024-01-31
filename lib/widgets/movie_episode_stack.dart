import 'package:flutter/material.dart';
import 'package:ronasapp/models/models.dart';

class MovieEpisodeStack extends StatelessWidget {
  const MovieEpisodeStack({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(right: 15),
          width: 170,
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black87.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
        ),
        // Positioned(
        //   right: 30,
        //   top: 10,
        //   child: Text(
        //     "${movie.minutes} min",
        //     style: TextStyle(
        //       color: Colors.grey[400],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
