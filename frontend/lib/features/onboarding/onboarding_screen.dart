import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants/variables.dart';
import 'onboarding_questions.dart';
// import 'package:nutri_glow/utils/validators.dart';
import '../../widgets/custom_onboarding_textfield.dart';

class OnboardingMainScreen extends StatefulWidget {
  const OnboardingMainScreen({super.key});

  @override
  State<OnboardingMainScreen> createState() => _OnboardingMainScreenState();
}

class _OnboardingMainScreenState extends State<OnboardingMainScreen> {
  ValueNotifier<int> questionNumberNotifier = ValueNotifier<int>(0);
  late List<GlobalKey<FormState>> questionKeys;

  @override
  void initState() {
    super.initState();
    // Initialize questionKeys with GlobalKey instances
    questionKeys = List.generate(
      questions.length,
      (index) => GlobalKey<FormState>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, bottom: 50),
        child: ValueListenableBuilder<int>(
            valueListenable: questionNumberNotifier,
            builder: (context, questionNumber, _) {
              return Form(
                key: questionKeys[questionNumber],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // questionNumber != 0
                    // ?
                    Column(
                      children: [
                        Text(
                          questions[questionNumber].text,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OnboardingTextField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: questions[questionNumber].controller,
                        ),
                      ],
                    )
                    // : Row(
                    //     children: [
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               questions[questionNumber].text,
                    //               style: const TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //             const SizedBox(
                    //               height: 20,
                    //             ),
                    //             TextFormField(
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter a value'; // Error message when value is empty
                    //                 }
                    //                 // Add your validation logic here
                    //                 return null;
                    //               },
                    //               controller:
                    //                   questions[questionNumber].controller,
                    //               keyboardType: TextInputType.number,
                    //               decoration: const InputDecoration(
                    //                 errorStyle: TextStyle(
                    //                   color: AppColors.errorColor,
                    //                 ),
                    //                 labelStyle: TextStyle(
                    //                   fontSize: 14,
                    //                 ),
                    //                 contentPadding: EdgeInsets.symmetric(
                    //                     vertical: 14.0, horizontal: 14.0),
                    //                 border: OutlineInputBorder(),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 25,
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               questions[questionNumber].text2 ?? '',
                    //               style: const TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //             const SizedBox(
                    //               height: 20,
                    //             ),
                    //             TextFormField(
                    //               validator: (String? value) {
                    //                 return validateWeight(value!);
                    //               },
                    //               keyboardType: TextInputType.number,
                    //               controller:
                    //                   questions[questionNumber].controller2,
                    //               decoration: const InputDecoration(
                    //                 errorStyle: TextStyle(
                    //                   color: AppColors.errorColor,
                    //                 ),
                    //                 labelStyle: TextStyle(
                    //                   fontSize: 14,
                    //                 ),
                    //                 contentPadding: EdgeInsets.symmetric(
                    //                     vertical: 14.0, horizontal: 14.0),
                    //                 border: OutlineInputBorder(),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        questionNumberNotifier.value != 0
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {
                                  if (questionNumberNotifier.value > 0) {
                                    questionNumberNotifier.value--;
                                  }
                                },
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : Container(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(4), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            // Validate current step/screen
                            if (questionKeys[questionNumber]
                                .currentState!
                                .validate()) {
                              // Proceed to the next step/screen
                              if (questionNumber < questions.length - 1) {
                                questionNumberNotifier.value++;
                              } else {
                                // Reach the end of the onboarding process
                                // Perform any final actions here
                              }
                            }
                          },
                          child: Text(
                            questionNumber == questions.length - 1
                                ? "Finish"
                                : "Next",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

// class OnboardingMainScreen extends StatefulWidget {
//   const OnboardingMainScreen({Key? key}) : super(key: key);

//   @override
//   State<OnboardingMainScreen> createState() => _OnboardingMainScreenState();
// }

// class _OnboardingMainScreenState extends State<OnboardingMainScreen> {
//   ValueNotifier<int> questionNumberNotifier = ValueNotifier<int>(0);
//   late List<GlobalKey<FormState>> questionKeys;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize questionKeys with GlobalKey instances
//     questionKeys = List.generate(
//       questions.length,
//       (index) => GlobalKey<FormState>(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.only(right: 32, left: 32, bottom: 50),
//         child: ValueListenableBuilder<int>(
//           valueListenable: questionNumberNotifier,
//           builder: (context, questionNumber, _) {
//             return Form(
//               key: questionKeys[
//                   questionNumber], // Use separate form key for each step
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         questions[questionNumber].text,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       OnboardingTextField(
//                         // Assuming you have a custom text field widget
//                         validator: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a value';
//                           }
//                           return null;
//                         },
//                         controller: questions[questionNumber].controller,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (questionNumber != 0)
//                         ElevatedButton(
//                           onPressed: () {
//                             questionNumberNotifier.value--;
//                           },
//                           child: const Text("Back"),
//                         ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Validate current step/screen
//                           if (questionKeys[questionNumber]
//                               .currentState!
//                               .validate()) {
//                             // Proceed to the next step/screen
//                             if (questionNumber < questions.length - 1) {
//                               questionNumberNotifier.value++;
//                             } else {
//                               // Reach the end of the onboarding process
//                               // Perform any final actions here
//                             }
//                           }
//                         },
//                         child: Text(
//                           questionNumber == questions.length - 1
//                               ? "Finish"
//                               : "Next",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
