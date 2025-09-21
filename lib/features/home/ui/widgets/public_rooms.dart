import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/home/ui/widgets/public_room_widget.dart';

class PublicRooms extends StatelessWidget {
  const PublicRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 20,
            children: [
              Text(
                "Public rooms: ",
                style: TextStylesManager.titleLarge.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorsManager.borderColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("48", style: TextStylesManager.titleMedium),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) => PublicRoomWidget(),
          ),
        ],
      ),
    );
  }
}
