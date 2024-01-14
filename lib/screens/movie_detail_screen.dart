import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/models/models.dart';

import '../widgets/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = './movieDetails';

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late ScrollController _textScrollController;
  @override
  void initState() {
    _textScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Movie Stack (background,title,rating,pub_year,category,description)

                MovieBannerStack(movie: movie, textScrollController: _textScrollController),
                const Gap(20),
                //if Movie show trailer , if serie show Episodes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    movie.episodesNumber > 1 ? "Episodes" : "Trailer",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Gap(10),
                //Episodes
                movie.episodesNumber > 1
                    ? Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: 280,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.episodesNumber,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MovieEpisodeStack(movie: movie),
                                  const Gap(8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text("Episode ${index + 1}"),
                                  )
                                ],
                              );
                            }),
                      )
                    :
                    //Movie Trailer
                    MovieTrailerStack(movie: movie),
                const Gap(100)
              ],
            ),
          ),

          //watch now button
          const FloatingWatchButton(),
        ],
      ),
    );
  }
}
