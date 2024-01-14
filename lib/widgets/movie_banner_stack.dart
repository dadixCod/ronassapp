import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/utils/utils.dart';

import '../core/core.dart';
import '../models/models.dart';


class MovieBannerStack extends StatelessWidget {
  const MovieBannerStack({
    super.key,
    required this.movie,
    required ScrollController textScrollController,
  }) : _textScrollController = textScrollController;

  final Movie movie;
  final ScrollController _textScrollController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 650,
          child: Image.asset(
            movie.path,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.background,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        movie.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: AppColors.orangColor,
                          ),
                          Text(
                            movie.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.orangColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      movie.publishingYear,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                      ),
                    ),
                    const Gap(10),
                    if (movie.seasons >= 1)
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[500],
                        ),
                      ),
                    const Gap(10),
                    if (movie.seasons >= 1)
                      Text(
                        movie.seasons == 1 ? "${movie.seasons} season" : "${movie.seasons} seasons",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500],
                        ),
                      ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    ...movie.category.map(
                      (category) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF243C5E).withOpacity(0.8),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 80,
                  child: SingleChildScrollView(
                    controller: _textScrollController,
                    child: Text(
                      movie.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
