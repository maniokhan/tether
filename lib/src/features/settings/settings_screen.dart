import 'package:flutter/material.dart';
import 'package:tetherapp1/src/theme/config_colors.dart';
import 'package:tetherapp1/src/theme/text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static MaterialPageRoute<SettingsScreen> route() {
    return MaterialPageRoute<SettingsScreen>(
      builder: (BuildContext context) => const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConfigColors.primary,
        title: const AppText.titleS20(
          'Settings',
          color: ConfigColors.white,
        ),
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
