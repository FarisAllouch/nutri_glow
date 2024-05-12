import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/variables.dart';

class CustomCalendarTextField extends StatefulWidget {
  const CustomCalendarTextField({super.key, required this.validator});

  final FormFieldValidator<String>? validator;

  @override
  State<CustomCalendarTextField> createState() =>
      _CustomCalendarTextFieldState();
}

class _CustomCalendarTextFieldState extends State<CustomCalendarTextField> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      readOnly: true,
      showCursor: false,
      controller: dateController,
      enabled: true,
      decoration: InputDecoration(
        labelText: "Select Date",
        prefixIcon: const Icon(Icons.calendar_today_rounded),
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
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          setState(() {
            dateController.text = DateFormat("dd.MM.yyyy").format(pickedDate);
          });
        }
      },
      style: const TextStyle(color: AppColors.labelEnteredColor),
    );
  }
}
