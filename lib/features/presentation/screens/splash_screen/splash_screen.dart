// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:try_ricki_2/features/presentation/screens/home_screen/home_screen.dart';

import 'package:try_ricki_2/features/presentation/screens/splash_screen/widgets/star_frame.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animatedController;

  @override
  void initState() {
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();

    initialize();
    super.initState();
  }

  initialize() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1E2D),
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/rick.png',
                  ),
                  Image.asset('assets/images/and.png'),
                  Image.asset(
                    'assets/images/morty.png',
                  ),
                  Image.asset(
                    'assets/images/boy.png',
                  ),
                  Image.asset(
                    'assets/images/oldman.png',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: RotationTransition(
              turns: animatedController,
              child: Center(
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.amber,
                  child: ClipPath(
                    clipper: StarClipper(),
                    child: Container(
                      color: const Color(0xff0B1E2D),
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
