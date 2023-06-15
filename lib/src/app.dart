import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/features/authentication/signin_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SigninScreen(),
    );
  }
}
