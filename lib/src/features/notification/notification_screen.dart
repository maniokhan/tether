import 'package:flutter/material.dart';
import 'package:tetherapp1/src/theme/config_colors.dart';
import 'package:tetherapp1/src/theme/text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static MaterialPageRoute<NotificationScreen> route() {
    return MaterialPageRoute<NotificationScreen>(
      builder: (BuildContext context) => const NotificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConfigColors.primary,
        centerTitle: true,
        title: const AppText.titleS20(
          'Notification',
          color: ConfigColors.white,
        ),
      ),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
