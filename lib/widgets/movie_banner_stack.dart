import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/utils/utils.dart';
import 'package:ronasapp/widgets/back_btn_circle.dart';

import '../core/core.dart';
import '../models/models.dart';
import '../providers/genres.dart';

class MovieBannerStack extends StatelessWidget {
  const MovieBannerStack({
    super.key,
    required this.movie,
    required ScrollController textScrollController,
    required ScrollController genreScrollController,
  })  : _textScrollController = textScrollController,
        _genreScrollController = genreScrollController;

  final Movie movie;
  final ScrollController _textScrollController;
  final ScrollController _genreScrollController;

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<Genres>(context);
    final genres = genreProvider.getMovieGenres(movie.genres);
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: 650,
            child: Image.network(
              "${ApiConstants.imagePath}${movie.posterPath}",
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
                          movie.title,
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
                              movie.voteAverage.roundToDouble().toString(),
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
                        movie.releaseDate,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500],
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                  const Gap(15),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _genreScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 7),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF243C5E).withOpacity(0.8),
                          ),
                          child: Text(
                            genre.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 80,
                    child: SingleChildScrollView(
                      controller: _textScrollController,
                      child: Text(
                        movie.overview,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 20,
            left: 20,
            child: BackBtnCircle(),
          ),
        ],
      ),
    );
  }
}
