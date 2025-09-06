import 'package:flutter/material.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/points_section_widget.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/question_time_left.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/question_widget.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              spacing: 15,
              children: [
                QuestionTimeLeft(),
                QuestionWidget(),
                const SizedBox(height: 5),
                PointsSectionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
