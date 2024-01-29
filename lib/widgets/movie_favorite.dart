import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/providers/movies.dart';
import 'package:ronasapp/utils/extensions.dart';

class MovieFavorite extends StatelessWidget {
  final Movie movie;
  final double height;
  final double width;
  const MovieFavorite({
    super.key,
    required this.movie,
    this.height = 320,
    this.width = 220,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                movie.path,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Consumer<Movies>(
                builder: (context, prov, _) => GestureDetector(
                  onTap: () {
                    prov.makeFavorite(movie);
                  },
                  child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey[200]!.withOpacity(0.8),
                            Colors.grey[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Icon(
                        movie.isFavorite
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 65,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: movie.rating >= 8
                        ? [
                            Colors.green[300]!,
                            Colors.green,
                          ]
                        : [
                            Colors.orange[200]!,
                            Colors.orange,
                          ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      movie.rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
      ],
    );
  }
}
