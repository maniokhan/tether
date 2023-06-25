import 'package:flutter/material.dart';
// import 'package:tether_pet_owner/src/features/pet_owner/dashboard/dashboard_screen.dart';
import 'package:tether_pet_owner/src/features/authentication/signin_screen.dart';

import 'package:tether_pet_owner/src/theme/data.dart';
import 'package:tether_pet_owner/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const DashBoardScreen(),
      home: const SigninScreen(),
      builder: (BuildContext context, Widget? child) {
        return AppTheme(
          data: const AppThemeData(),
          child: child!,
        );
      },
    );
  }
}
