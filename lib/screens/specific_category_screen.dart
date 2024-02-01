import 'package:flutter/material.dart';
import 'package:ronasapp/widgets/movie_card.dart';

import '../models/models.dart';

class SpecificCategoryScreen extends StatelessWidget {
  static const routeName = '/specificCategoryScreen';

  const SpecificCategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: false,
            pinned: false,
            // expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(arguments[0]),
              expandedTitleScale: 2,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 0,
              mainAxisExtent: 320,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final movie = arguments[1][index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: MovieCard(
                    movie: movie,
                  ),
                );
              },
              childCount: arguments[1].length,
            ),
          )
        ],
      ),
    );
  }
}
