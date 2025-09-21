import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/answer_widget.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/game_floating_action_button.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/room_chat.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/verify_answer_player_card.dart';

class AnswerVerificationScreen extends StatelessWidget {
  const AnswerVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            spacing: 15,
            children: [
              AnswerWidget(),
              RoomChat(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current Rank",
                          style: TextStylesManager.titleMedium,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsManager.borderColor,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Text(
                            "4/10",
                            style: TextStylesManager.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return VerifyAnswerPlayerCard(isHost: true);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GameFloatingActionButton(text: "Submit Answers"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
