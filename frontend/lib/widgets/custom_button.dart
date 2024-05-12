import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color fontColor;
  final Color buttonColor;
  final String? iconName;
  final bool containIcon;
  final double? buttonRadius;
  final bool textCapitalization;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.fontColor,
      required this.buttonColor,
      required this.containIcon,
      required this.textCapitalization,
      this.buttonRadius,
      this.iconName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                buttonRadius != null ? buttonRadius! : 4), // <-- Radius
          ),
        ),
        child: containIcon
            ? Row(
                children: [
                  SvgPicture.asset(iconName!),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    textCapitalization ? buttonText.toUpperCase() : buttonText,
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: fontColor,
                        fontFamily: 'Roboto'),
                  ),
                ],
              )
            : Text(
                textCapitalization ? buttonText.toUpperCase() : buttonText,
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                    fontFamily: 'Roboto'),
              ),
      ),
    );
  }
}
