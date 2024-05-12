import 'package:flutter/material.dart';
import '../constants/variables.dart';

class OnboardingTextField extends StatefulWidget {
  const OnboardingTextField(
      {super.key, required this.validator, required this.controller});
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;

  @override
  State<OnboardingTextField> createState() => _OnboardingTextFieldState();
}

class _OnboardingTextFieldState extends State<OnboardingTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      enabled: true,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 3,
      decoration: const InputDecoration(
        errorStyle: TextStyle(
          color: AppColors.errorColor,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
      ),
    );
  }
}
