import 'package:flutter/material.dart';
import 'features/onbording/presentation/pages/step1_screen.dart';
import 'features/onbording/presentation/pages/step2_page.dart';
import 'features/onbording/presentation/pages/step3_page.dart';
import 'features/home/pages/home_screen.dart';

void main() {
  runApp(const OnboardingApp());
}

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3-Step Onboarding',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => Step1UserDetails(),
        '/step2': (context) => Step2PinSetup(),
        '/step3': (context) => const Step3TermsConditions(),
        '/success': (context) => const HomeScreen(),
      },
    );
  }
}
