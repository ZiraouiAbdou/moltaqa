import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/helpers/email_validator.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/auth/logic/cubit/auth_cubit.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool passwordOff = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: "Email Address",
            prefixIcon: Icon(
              Icons.email_outlined,
              color: ColorsManager.primaryColor,
            ),
            textInputAction: TextInputAction.next,
            validator: (mail) {
              return emailValidator(mail);
            },
          ),
          SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setstate) {
              return CustomTextFormField(
                controller: passwordController,
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
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 30),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: ColorsManager.red,
                  ),
                );
              }
              if (state is LoginSuccess) {
                context.go(RoutesConstants.authRedirector);
              }
            },
            builder: (context, state) {
              return switch (state) {
                LoginLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),

                _ => CustomButton(
                  text: "Sign in",
                  textColor: ColorsManager.white,
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      context.read<AuthCubit>().loginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    }
                  },
                ),
              };
            },
          ),

          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              context.push(RoutesConstants.forgotPassword);
            },
            child: Text(
              "Forgot Password?",
              style: TextStylesManager.bodyLarge.copyWith(
                color: ColorsManager.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
