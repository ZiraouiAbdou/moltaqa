import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class RoomChat extends StatelessWidget {
  const RoomChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffCAE8BD),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.chat_outlined),
          Text("Jack: I mean og", style: TextStylesManager.titleMedium),
        ],
      ),
    );
  }
}
