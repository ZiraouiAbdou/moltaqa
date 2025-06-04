import 'package:flutter/material.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Username",
          prefixIcon: Icon(
            Icons.person_outline,
            color: ColorsManager.primaryColor,
          ),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          hintText: "Email Address",
          prefixIcon: Icon(
            Icons.email_outlined,
            color: ColorsManager.primaryColor,
          ),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          hintText: "Password",
          prefixIcon: Icon(
            Icons.lock_outline,
            color: ColorsManager.primaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: ColorsManager.grey,
          ),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          hintText: "Confirm Password",
          prefixIcon: Icon(
            Icons.lock_outline,
            color: ColorsManager.primaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: ColorsManager.grey,
          ),
        ),
        SizedBox(height: 30),
        CustomButton(text: "Sign up", textColor: ColorsManager.white),
      ],
    );
  }
}
