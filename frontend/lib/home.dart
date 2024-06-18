import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/authentication/sign_in.dart';

class MySwipeScreen extends StatefulWidget {
  const MySwipeScreen({super.key});

  @override
  _MySwipeScreenState createState() => _MySwipeScreenState();
}

class _MySwipeScreenState extends State<MySwipeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int _currentPage = 0;
  List<String> imagePaths = [
    'frontend/images/diet.jpg',
    'frontend/images/diet.jpg',
    'frontend/images/diet.jpg',
  ];
  List<String> texts1 = [
    'Proper Exercises',
    'Trained Doctor Advices',
    'Full Support',
  ];
  List<String> texts = [
   'A healthy diet is not about strict limitations, staying unrealistically thin, or depriving yourself of the foods you love.\n Rather, its about feeling great, having more energy, improving your health, and boosting your mood.',
  ];

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.sizeOf(context).height;
    final deviceW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  setState(() {
                    _currentPage =
                        (_currentPage - 1).clamp(0, imagePaths.length - 1);
                  });
                } else if (details.primaryVelocity! < 0) {
                  setState(() {
                    _currentPage =
                        (_currentPage + 1).clamp(0, imagePaths.length - 1);
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 70, right: 70, top: 80),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imagePaths[_currentPage],
                          height: deviceH - 400,
                          width: deviceW - 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      texts1[_currentPage],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28.0,
                        color: Color(0xFF4A4B4D),
                        fontFamily: 'assets/font/Metropolis-Regular/otf',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      texts[_currentPage],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF4A4B4D),
                        fontFamily: 'assets/font/Metropolis-Regular/otf',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.go("/onboarding");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  // Text color
                ),
                child: const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(19.0),
                      child: Center(child: Text('Next')),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
