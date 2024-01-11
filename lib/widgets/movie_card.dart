import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/utils/extensions.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 260,
              width: 180,
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
              child: GestureDetector(
                onTap: () {},
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
                    child: const Icon(
                      Icons.bookmark_outline,
                      color: Colors.white,
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
        SizedBox(
          width: 180,
          child: Text(
            movie.name,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyLarge!.copyWith(),
          ),
        ),
        SizedBox(
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  movie.category.first.toString(),
                  style: TextStyle(
                    color: context.colorScheme.outline,
                  ),
                ),
              ),
              const Gap(7),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.outline,
                ),
              ),
              const Gap(7),
              Text(
                "${movie.minutes} mins",
                style: TextStyle(
                  color: context.colorScheme.outline,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
