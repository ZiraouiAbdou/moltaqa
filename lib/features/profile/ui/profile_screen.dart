import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/constants/assets_consts.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            spacing: 10,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundImage: AssetImage(AssetsConsts.authAvatarr),
                ),
              ),
              Text("Alex", style: TextStylesManager.heading3),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Joined Since", style: TextStylesManager.bodySmall),
                  Text(
                    "Jun 2025",
                    style: TextStylesManager.bodyMedium.copyWith(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Number of plays", style: TextStylesManager.bodySmall),
                  Text(
                    "410",
                    style: TextStylesManager.bodyMedium.copyWith(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Statistics: ", style: TextStylesManager.heading3),
              ),
              Row(
                children: [
                  // 1st Place (Gold)
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFFD700), // Gold
                            const Color(0xFFFFECB3), // Light Gold
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFFFD700,
                            ).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("15", style: TextStylesManager.heading2),
                          Text(
                            "1st Place",
                            style: TextStylesManager.bodyMedium.copyWith(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // 2nd Place (Silver)
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFC0C0C0), // Silver
                            const Color(0xFFE0E0E0), // Light Silver
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFC0C0C0,
                            ).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("10", style: TextStylesManager.heading2),
                          Text(
                            "2nd Place",
                            style: TextStylesManager.bodyMedium.copyWith(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // 3rd Place (Bronze)
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFCD7F32), // Bronze
                            const Color(0xFFE6C19E), // Light Bronze
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFCD7F32,
                            ).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("8", style: TextStylesManager.heading2),
                          Text(
                            "3rd Place",
                            style: TextStylesManager.bodyMedium.copyWith(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
