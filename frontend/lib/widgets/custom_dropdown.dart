import 'package:flutter/material.dart';
import '../constants/variables.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.validator,
    this.hintText,
    this.items,
    this.prefixIcon,
  });
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final Icon? prefixIcon;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final ValueNotifier<String?> selectedGender = ValueNotifier<String?>(null);

  @override
  void dispose() {
    selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedGender,
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
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
            isExpanded: true,
            hint: Text(
              widget.hintText!,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.labelColor,
              ),
            ),
            items: widget.items,
            onChanged: (selectedValue) {
              selectedGender.value = selectedValue;
            },
            validator: widget.validator,
            style: const TextStyle(color: Colors.black),
            dropdownColor: AppColors.textFieldBackground,
          ),
        );
      },
    );
  }
}
