import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class GameFloatingActionButton extends StatelessWidget {
  final String text;
  const GameFloatingActionButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 0.7.sw,
      height: 50.h,
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      child: Text(
        text,
        style: TextStylesManager.titleMedium.copyWith(color: Colors.white),
      ),
    );
  }
}
