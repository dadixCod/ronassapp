import 'package:flutter/material.dart';
import 'package:ronasapp/screens/screens.dart';
import 'package:ronasapp/theme/app_theme.dart';
import 'package:ronasapp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/providers/providers.dart';

class RonasApp extends StatefulWidget {
  const RonasApp({super.key});

  @override
  State<RonasApp> createState() => _RonasAppState();
}

class _RonasAppState extends State<RonasApp> {
    int currentIndex = 0;
    final screens = const [
      HomeScreen(),
      CategoriesScreen(),
      FavoritesScreen(),
      ProfileScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Movies>(create: (ctx) => Movies()),
        ChangeNotifierProvider<Directors>(create: (ctx)=> Directors())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onPress: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        ),
        routes: {
          DirectorDetails.routeName: (context) => const DirectorDetails(),
          MovieDetailsScreen.routeName : (context) => const MovieDetailsScreen(),
        },
      ),
    );
  }
}
