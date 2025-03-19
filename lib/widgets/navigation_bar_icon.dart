import 'package:flutter/material.dart';

class NavigationBarIcon extends StatelessWidget {
  final String path;
  final Color color;

  const NavigationBarIcon({super.key, required this.path, required this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      color: color,
      width: 20,
      height: 20,
    );
  }
}
