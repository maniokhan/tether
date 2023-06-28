import 'package:flutter/material.dart';
import 'package:tetherapp1/src/features/notification/notification_screen.dart';
// import 'package:tetherapp1/src/features/pet_owner/dashboard/dashboard_screen.dart';
import 'package:tetherapp1/src/theme/data.dart';
import 'package:tetherapp1/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const DashBoardScreen(),
      home: const NotificationScreen(),
      builder: (BuildContext context, Widget? child) {
        return AppTheme(
          data: const AppThemeData(),
          child: child!,
        );
      },
    );
  }
}
