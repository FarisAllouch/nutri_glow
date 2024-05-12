import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/variables.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_calendar_textfield.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_dropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ValueNotifier<bool> agreeToTermsNotifier = ValueNotifier(false);

  @override
  void dispose() {
    agreeToTermsNotifier.dispose();
    super.dispose();
  }

  toggleCheckbox() {
    agreeToTermsNotifier.value = !agreeToTermsNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(
          value: 'Male',
          child: Text(
            'Male',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.labelEnteredColor,
            ),
          )),
      const DropdownMenuItem(
          value: 'Female',
          child: Text(
            'Female',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.labelEnteredColor,
            ),
          )),
      //
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Icon(Icons.arrow_back_rounded),
                        onTap: () async {
                          context.go('/');
                        },
                      ),
                      SvgPicture.asset(
                        'frontend/images/logo.svg',
                        width: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextField(
                    prefixIcon: Icon(Icons.account_circle),
                    validator: nameSurnameValidator,
                    labelText: "Name",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const CustomTextField(
                    prefixIcon: Icon(Icons.perm_identity),
                    validator: nameSurnameValidator,
                    labelText: "Surname",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomCalendarTextField(
                    validator: (value) => validateDate(value!),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomDropdown(
                    validator: (value) => genderValidator(value),
                    hintText: "Select an option",
                    items: items,
                    prefixIcon: Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const CustomTextField(
                    prefixIcon: Icon(Icons.email),
                    validator: emailValidator,
                    labelText: "Email",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const CustomTextField(
                    prefixIcon: Icon(Icons.lock),
                    validator: passwordValidator,
                    labelText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: agreeToTermsNotifier,
                        builder: (context, value, child) {
                          return SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: agreeToTermsNotifier.value,
                              onChanged: (bool? value) {
                                toggleCheckbox();
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("I understood the "),
                      const Text(
                        "terms & policy.",
                        style: TextStyle(color: AppColors.primaryColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    textCapitalization: true,
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          agreeToTermsNotifier.value) {
                        context.go("/onboarding");
                        print("Validated");
                      }
                    },
                    buttonText: "Sign Up",
                    fontColor: Colors.white,
                    buttonColor: AppColors.primaryColor,
                    containIcon: false,
                    buttonRadius: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "or sign up with",
                      style: TextStyle(color: AppColors.dividerTextColor),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 43, vertical: 21),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 25,
                            minHeight: 40,
                          ),
                          child: SvgPicture.asset(
                            'frontend/icons/facebook.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 43, vertical: 21),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 25,
                            minHeight: 40,
                          ),
                          child: SvgPicture.asset(
                            'frontend/icons/google.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(color: AppColors.dividerTextColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/sign_in');
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
