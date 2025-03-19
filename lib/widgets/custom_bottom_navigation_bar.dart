import 'package:flutter/material.dart';
import 'package:ronasapp/utils/utils.dart';
import 'package:ronasapp/widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onPress;
  const CustomBottomNavigationBar(
      {super.key, required this.onPress, required this.currentIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final activeColor = context.colorScheme.primary;
    final inActiveColor = context.colorScheme.outline;
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        useLegacyColorScheme: true,
        showSelectedLabels: false,
        elevation: 0,
        currentIndex: widget.currentIndex,
        onTap: widget.onPress,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: NavigationBarIcon(
              path: 'assets/icons/home_outlined.png',
              color: inActiveColor,
            ),
            activeIcon: NavigationBarIcon(
              path: 'assets/icons/home.png',
              color: activeColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: NavigationBarIcon(
              path: 'assets/icons/menu_outlined.png',
              color: inActiveColor,
            ),
            activeIcon: NavigationBarIcon(
              path: 'assets/icons/menu.png',
              color: activeColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: NavigationBarIcon(
              path: 'assets/icons/bookmark_outlined.png',
              color: inActiveColor,
            ),
            activeIcon: NavigationBarIcon(
              path: 'assets/icons/bookmark.png',
              color: activeColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: NavigationBarIcon(
              path: 'assets/icons/profile_outlined.png',
              color: inActiveColor,
            ),
            activeIcon: NavigationBarIcon(
              path: 'assets/icons/profile.png',
              color: activeColor,
            ),
          ),
        ],
      ),
    );
  }
}
