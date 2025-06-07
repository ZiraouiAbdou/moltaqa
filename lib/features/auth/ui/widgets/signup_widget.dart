import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/helpers/email_validator.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/features/auth/logic/cubit/auth_cubit.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool passwordOff = true;
  bool confirmPasswordOff = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: usernameController,
            hintText: "Username",
            prefixIcon: Icon(
              Icons.person_outline,
              color: ColorsManager.primaryColor,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              if (value.length < 2) {
                return 'Username must be at least 2 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            controller: emailController,
            hintText: "Email Address",
            prefixIcon: Icon(
              Icons.email_outlined,
              color: ColorsManager.primaryColor,
            ),
            textInputAction: TextInputAction.next,
            validator: (mail) => emailValidator(mail),
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
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setstate) {
              return CustomTextFormField(
                controller: confirmPasswordController,
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
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 30),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignupFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: ColorsManager.red,
                  ),
                );
              }
              if (state is SignupSuccess) {
                context.go(RoutesConstants.homeScreen);
              }
            },
            builder: (context, state) {
              return switch (state) {
                SignupLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                _ => CustomButton(
                  text: "Sign up",
                  textColor: ColorsManager.white,
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      context.read<AuthCubit>().createUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        userName: usernameController.text.trim(),
                      );
                    }
                  },
                ),
              };
            },
          ),
        ],
      ),
    );
  }
}
