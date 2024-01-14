import 'package:flutter/material.dart';
import 'package:ronasapp/utils/utils.dart';
class FloatingWatchButton extends StatelessWidget {
  const FloatingWatchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                "Watch now",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}