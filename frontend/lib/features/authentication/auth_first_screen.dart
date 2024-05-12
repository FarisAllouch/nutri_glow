import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/variables.dart';
import '../../widgets/custom_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 1 / 2,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: SvgPicture.asset(
                  'frontend/images/meal.svg',
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 1 / 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      textCapitalization: false,
                      containIcon: false,
                      onPressed: () {
                        context.go("/sign_up");
                      },
                      buttonText: "Sign up with email",
                      buttonColor: Colors.black,
                      fontColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                        )),
                        Padding(
                          padding: EdgeInsets.only(right: 16, left: 16),
                          child: Text(
                            "or use social sign up",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      textCapitalization: false,
                      containIcon: true,
                      iconName: "frontend/icons/google.svg",
                      onPressed: () {},
                      buttonText: "Continue with Google",
                      buttonColor: Colors.white,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      textCapitalization: false,
                      containIcon: true,
                      iconName: "frontend/icons/facebook.svg",
                      onPressed: () {},
                      buttonText: "Continue with Facebook",
                      buttonColor: Colors.white,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go("/sign_in");
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              color: Color.fromRGBO(232, 218, 251, 1),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
