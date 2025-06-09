import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class PublicRoomWidget extends StatelessWidget {
  const PublicRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 5,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,

              border: Border.fromBorderSide(
                BorderSide(color: ColorsManager.primaryColor, width: 2.5),
              ),
            ),
            child: CircleAvatar(
              child: Text(
                "Moltaqa\nRoom",
                style: TextStylesManager.titleSmall,
                textAlign: TextAlign.center,
              ),
              radius: 50.r,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title title title titletitletitle title title eee",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStylesManager.heading3,
                ),
                const Spacer(),
                Text("Host name", style: TextStylesManager.bodySmall),
                Text("24 Players", style: TextStylesManager.titleSmall),
                Text(
                  "Created 26 minutes ago",
                  style: TextStylesManager.bodySmall.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
