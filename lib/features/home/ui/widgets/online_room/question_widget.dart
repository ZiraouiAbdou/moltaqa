import 'package:flutter/material.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Question Question Question ",
            style: TextStylesManager.titleMedium,
            maxLines: 3,
          ),
          Text("10 of 15", style: TextStylesManager.bodyMedium),
          CustomTextFormField(hintText: "Tap To Answer"),
        ],
      ),
    );
  }
}
