import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';

class TextStylesManager {
  // Headings
  static TextStyle heading1 = TextStyle(
    fontSize: 32.sp.clamp(24, 40),
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
    height: 1.2,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 24.sp.clamp(20, 32),
    fontWeight: FontWeight.w600,
    color: ColorsManager.black,
    height: 1.3,
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 20.sp.clamp(18, 24),
    fontWeight: FontWeight.w600,
    color: ColorsManager.black,
    height: 1.3,
  );

  // Titles
  static TextStyle titleLarge = TextStyle(
    fontSize: 18.sp.clamp(16, 22),
    fontWeight: FontWeight.w500,
    color: ColorsManager.black,
    height: 1.4,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w500,
    color: ColorsManager.black,
    height: 1.4,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w500,
    color: ColorsManager.black,
    height: 1.4,
  );

  // Body text
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.normal,
    color: ColorsManager.black,
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.normal,
    color: ColorsManager.black,
    height: 1.5,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp.clamp(10, 14),
    fontWeight: FontWeight.normal,
    color: ColorsManager.black,
    height: 1.5,
  );

  // Buttons
  static TextStyle buttonPrimary = TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w600,
    color: ColorsManager.white,
    height: 1.4,
  );

  static TextStyle buttonSecondary = TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w600,
    color: ColorsManager.primaryColor,
    height: 1.4,
  );

  // Captions
  static TextStyle caption = TextStyle(
    fontSize: 12.sp.clamp(10, 14),
    fontWeight: FontWeight.w400,
    color: ColorsManager.black,
    height: 1.4,
  );

  // Special cases
  static TextStyle errorText = TextStyle(
    fontSize: 12.sp.clamp(10, 14),
    fontWeight: FontWeight.w500,
    color: ColorsManager.red,
    height: 1.4,
  );

  static TextStyle linkText = TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w500,
    color: ColorsManager.primaryColor,
    decoration: TextDecoration.underline,
    height: 1.4,
  );
}
