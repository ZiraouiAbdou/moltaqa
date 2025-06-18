import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class LobbyIntroCard extends StatelessWidget {
  const LobbyIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                    const SizedBox(height: 10),
                    Text("By Host name", style: TextStylesManager.bodySmall),
                    Text(
                      "100,00 Plays, 220 Question",
                      style: TextStylesManager.bodySmall.copyWith(
                        color: ColorsManager.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Pack Description DescriptionDescription Description sda  Description Description Description  Description",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStylesManager.titleSmall,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Code: ",
              style: TextStylesManager.titleSmall.copyWith(
                color: ColorsManager.grey,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                BorderSide(width: 2, color: ColorsManager.primaryColor),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("456798", style: TextStylesManager.heading1),
          ),
        ],
      ),
    );
  }
}
