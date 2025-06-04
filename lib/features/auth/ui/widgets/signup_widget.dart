import 'package:flutter/material.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool passwordOff = true;
  bool confirmPasswordOff = true;
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
        StatefulBuilder(
          builder: (context, setstate) {
            return CustomTextFormField(
              hintText: "Password",
              isObscureText: passwordOff,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: ColorsManager.primaryColor,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordOff
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                color: ColorsManager.grey,
                onPressed: () {
                  setstate(() {});
                  passwordOff = !passwordOff;
                },
              ),

              textInputAction: TextInputAction.next,
            );
          },
        ),
        SizedBox(height: 10),
        StatefulBuilder(
          builder: (context, setstate) {
            return CustomTextFormField(
              hintText: "Confirm Password",
              isObscureText: confirmPasswordOff,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: ColorsManager.primaryColor,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  confirmPasswordOff
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                color: ColorsManager.grey,
                onPressed: () {
                  setstate(() {});
                  confirmPasswordOff = !confirmPasswordOff;
                },
              ),
            );
          },
        ),
        SizedBox(height: 30),
        CustomButton(text: "Sign up", textColor: ColorsManager.white),
      ],
    );
  }
}
