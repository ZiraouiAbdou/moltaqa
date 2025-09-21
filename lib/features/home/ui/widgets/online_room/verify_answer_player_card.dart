import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class VerifyAnswerPlayerCard extends StatefulWidget {
  final bool? isHost;
  const VerifyAnswerPlayerCard({super.key, this.isHost});

  @override
  State<VerifyAnswerPlayerCard> createState() => _VerifyAnswerPlayerCardState();
}

class _VerifyAnswerPlayerCardState extends State<VerifyAnswerPlayerCard> {
  ValueNotifier<bool> isActive = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: ColorsManager.lightGrey.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,

            child: Text("A", style: TextStylesManager.titleMedium),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jack",
                  style: TextStylesManager.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),
                ValueListenableBuilder<bool>(
                  valueListenable: isActive,
                  builder: (context, value, child) {
                    return Text(
                      "Player Answer berrr asd sad sad",
                      style: TextStylesManager.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color:
                            isActive.value ? Colors.green : ColorsManager.red,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 3),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: ColorsManager.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "Active",
                style: TextStylesManager.bodySmall.copyWith(
                  color: Colors.grey[600],
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(width: 3),
          if (widget.isHost == true)
            SizedBox(
              height: 30,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ValueListenableBuilder<bool>(
                  valueListenable: isActive,
                  builder: (context, value, child) {
                    return CupertinoSwitch(
                      activeTrackColor: Colors.green,
                      value: isActive.value,
                      onChanged: (value) {
                        isActive.value = !isActive.value;
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
