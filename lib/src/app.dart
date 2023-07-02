import 'package:flutter/material.dart';
// import 'package:newtetherpets/src/features/pet_owner/dashboard/dashboard_screen.dart';
import 'package:newtetherpets/src/features/authentication/signin_screen.dart';
import 'package:newtetherpets/src/theme/data.dart';
import 'package:newtetherpets/src/theme/theme.dart';

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
