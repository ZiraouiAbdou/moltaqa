import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/constants/assets_consts.dart';
import 'package:moltaqa/core/helpers/email_validator.dart';
import 'package:moltaqa/core/shared_widgets/custom_button.dart';
import 'package:moltaqa/core/shared_widgets/custom_text_form_field.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/auth/logic/cubit/auth_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft, child: BackButton()),
                    Text("Forgot Passowrd?", style: TextStylesManager.heading3),
                    const SizedBox(height: 20),
                    Image.asset(AssetsConsts.lockImage, height: 250.h),
                    const SizedBox(height: 20),
                    Text(
                      "Please enter your email address",
                      style: TextStylesManager.titleLarge,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) => emailValidator(email),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: StatefulBuilder(
          builder: (context, setstate) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: BlocConsumer<AuthCubit, AuthState>(
                buildWhen:
                    (previous, current) =>
                        current is ForgotPasswordLoading ||
                        current is ForgotPasswordFailed ||
                        current is ForgotPasswordSuccess ||
                        current is CountdownUpdated,

                listener: (context, state) {
                  if (state is ForgotPasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password reset email sent!'),
                        backgroundColor: ColorsManager.green,
                      ),
                    );
                    // Start countdown on success
                    context.read<AuthCubit>().startPasswordResetCountdown();
                  }
                  if (state is ForgotPasswordFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: ColorsManager.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  int countdown =
                      context.read<AuthCubit>().resetPasswordCountdown;
                  return SizedBox(
                    height: 56.h,
                    child:
                        state is ForgotPasswordLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                              text:
                                  countdown > 0
                                      ? "${countdown.toString()} S"
                                      : "Send",
                              backgroundColor:
                                  countdown > 0 ? ColorsManager.grey : null,
                              borderColor:
                                  countdown > 0 ? ColorsManager.grey : null,
                              textColor: ColorsManager.white,
                              onTap: () {
                                if (countdown == 0) {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    context
                                        .read<AuthCubit>()
                                        .sendPasswordResetEmail(
                                          email: emailController.text.trim(),
                                        );
                                  }
                                }
                              },
                            ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
