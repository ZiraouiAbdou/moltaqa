import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool? arrowVisible;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final TextStyle? textStyle;
  final bool? addMargin;
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.arrowVisible,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
    this.textStyle,
    this.addMargin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin:
            addMargin != null && addMargin!
                ? EdgeInsets.symmetric(horizontal: 15.w)
                : null,
        height: height ?? 56.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor ?? ColorsManager.primaryColor),
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                TextStylesManager.bodyMedium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
