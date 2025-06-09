import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class EnterYourCodeWidget extends StatelessWidget {
  const EnterYourCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: 100,
      right: 0,
      left: 0,
      bottom: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: 0.9.sw,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your code",
                style: TextStylesManager.heading3.copyWith(
                  color: ColorsManager.black,
                ),
              ),
              Text(
                "To play with your friends",
                style: TextStylesManager.bodyMedium.copyWith(
                  color: ColorsManager.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ex : 123456',
                  hintStyle: const TextStyle(color: Colors.black38),
                  filled: true,
                  fillColor: ColorsManager.fillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 12,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: CustomButton(
                      text: "Enter",
                      width: 80.w,
                      height: 40.h,
                      textColor: ColorsManager.white,
                      borderRadius: 5,
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
