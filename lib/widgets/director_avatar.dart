import 'package:flutter/material.dart';
import 'package:ronasapp/models/director.dart';
import 'package:ronasapp/utils/utils.dart';

class DirectorAvatar extends StatelessWidget {
  final Director director;
  const DirectorAvatar({super.key, required this.director});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: context.colorScheme.outline.withOpacity(0.6),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: context.colorScheme.background,
            backgroundImage: AssetImage(director.path),
            radius: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: 85,
            child: Text(
              director.name,
              style: context.textTheme.bodyLarge!.copyWith(
                height: 1.2,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
