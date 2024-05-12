import 'package:intl/intl.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Field cannot be empty";
  }

  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  if (!emailValid) {
    return "Enter a valid email address";
  }

  return null;
}

String? nameSurnameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field cannot be empty';
  }

  final nameRegex = RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)*$');

  if (!nameRegex.hasMatch(value)) {
    return 'Enter a valid name/surname';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field cannot be empty';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}

String? validateDate(String? dateString) {
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  if (dateString!.isEmpty) {
    return 'Please select a date.';
  }
  DateTime dateTime = dateFormat.parse(dateString);

  DateTime currentDate = DateTime.now();

  if (currentDate.microsecondsSinceEpoch < dateTime.microsecondsSinceEpoch) {
    return 'User must be born.';
  }

  int yearDifference = currentDate.year - dateTime.year;
  if (yearDifference >= 100) {
    return 'Age must be less than 100 years.';
  }

  return null;
}

String? genderValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select a gender';
  }
  return null;
}

String? validateWeight(String value) {
  if (value.isEmpty) {
    return 'Please enter your weight';
  }
  // Regular expression to match numbers with one or more digits followed by an optional decimal point and digits
  // Allows values like: 50, 50.5, 50.55, etc.
  RegExp regex = RegExp(r'^\d+(\.\d+)?$');
  if (!regex.hasMatch(value)) {
    return 'Enter a valid weight';
  }
  return null;
}

String? validateHeight(String value) {
  if (value.isEmpty) {
    return 'Please enter your height';
  }
  // Regular expression to match numbers with one or more digits
  RegExp regex = RegExp(r'^\d+$');
  if (!regex.hasMatch(value)) {
    return 'Enter a valid height';
  }
  return null;
}

String? validateOnboarding(String value) {
  if (value.isEmpty) {
    return 'Please enter your weight';
  }
  return null;
}
