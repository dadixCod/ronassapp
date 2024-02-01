import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/models/models.dart';

import '../providers/genres.dart';
import '../widgets/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = './movieDetails';

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late ScrollController _textScrollController;
  late ScrollController _genreScrollController;
  @override
  void initState() {
    _textScrollController = ScrollController();
    _genreScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textScrollController.dispose();
    _genreScrollController.dispose();
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
                MovieBannerStack(
                  movie: movie,
                  textScrollController: _textScrollController,
                  genreScrollController: _genreScrollController,
                ),
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Trailer",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Gap(10),
                MovieTrailerStack(movie: movie),
                const Gap(100)
              ],
            ),
          ),
          const FloatingWatchButton(),
        ],
      ),
    );
  }
}
