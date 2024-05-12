import 'package:flutter/material.dart';
import '../constants/variables.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
  });

  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Icon prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool isError = false;
  final ValueNotifier<bool> isVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    isVisible.dispose();
    super.dispose();
  }

  toggleVisibleIcon() {
    isVisible.value = !isVisible.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isVisible,
        builder: (context, value, child) {
          return TextFormField(
            controller: _controller,
            validator: widget.validator,
            enabled: true,
            obscureText:
                widget.obscureText ? !isVisible.value : isVisible.value,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        toggleVisibleIcon();
                      },
                      child: isVisible.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    )
                  : null,
              labelText: widget.labelText,
              errorStyle: const TextStyle(
                color: AppColors.errorColor,
              ),
              labelStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.labelColor,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.textFieldBackground,
            ),
            style: const TextStyle(color: AppColors.labelEnteredColor),
          );
        });
  }
}
