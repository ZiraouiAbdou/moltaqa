import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/features/home/ui/widgets/enter_your_code_widget.dart';
import 'package:moltaqa/features/home/ui/widgets/lets_play_widget.dart';
import 'package:moltaqa/features/home/ui/widgets/public_rooms.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.335.sh,
                  child: Stack(
                    children: [
                      Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryColor.withValues(
                            alpha: 0.85,
                          ),
                        ),
                      ),
                      LetsPlayWidget(),
                      EnterYourCodeWidget(),
                    ],
                  ),
                ),
                PublicRooms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
