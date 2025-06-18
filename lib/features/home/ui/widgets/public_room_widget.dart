import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class PublicRoomWidget extends StatelessWidget {
  const PublicRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          useRootNavigator: true,
          context: context,
          builder:
              (context) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      child: Text(
                        "Room",
                        style: TextStylesManager.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      radius: 40.r,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Title title title titletitletitle title title eee",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStylesManager.heading3,
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "Join",
                            textColor: ColorsManager.white,
                            onTap: () {
                              context.pop();
                              context.push(RoutesConstants.lobbyScreen);
                            },
                          ),
                        ],
                      ),
                    ),
                    CloseButton(onPressed: () => context.pop()),
                  ],
                ),
              ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
