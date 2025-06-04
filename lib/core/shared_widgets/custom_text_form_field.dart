import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final int? maxLength;
  final bool? readOnly;
  final String? errorText;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.maxLength,
    this.textInputAction,
    this.readOnly,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsManager.grey),
              borderRadius: BorderRadius.circular(15),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsManager.grey),
              borderRadius: BorderRadius.circular(15),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.3),
          borderRadius: BorderRadius.circular(15),
        ),
        errorMaxLines: 3,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorsManager.grey),
        ),
        hintStyle: hintStyle ?? TextStylesManager.bodySmall,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.extraLightgrey,
        filled: true,
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: isObscureText ?? false,
      textInputAction: textInputAction,
    );
  }
}
