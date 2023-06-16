import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static MaterialPageRoute<ProfileScreen> route() {
    return MaterialPageRoute<ProfileScreen>(
      builder: (BuildContext context) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConfigColors.primary,
        title: const AppText.titleS20(
          'Profile',
          color: ConfigColors.white,
        ),
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
