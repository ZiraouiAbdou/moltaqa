import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class LetsPlayWidget extends StatelessWidget {
  const LetsPlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Let's Play",
            style: TextStylesManager.heading3.copyWith(
              color: ColorsManager.white,
            ),
          ),
          Text(
            "Choose Your room",
            style: TextStylesManager.titleSmall.copyWith(
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
