import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/features/medical_records/medical_records_screen.dart';
import 'package:newtetherpets/src/features/profile/profile_screen.dart';
import 'package:newtetherpets/src/features/settings/settings_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ConfigColors.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    Assets.profilePhoto.path,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const AppText.titleS20(
                  'tetherpets Shaikh',
                  color: Colors.white,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 2.5,
                ),
                const AppText.titleS20(
                  'shaikhtetherpets983@gmail.com',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, ProfileScreen.route());
            },
            leading: const Icon(
              Icons.person_2_outlined,
              color: ConfigColors.secondary,
            ),
            title: const AppText.paragraphS16('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MedicalRecordsScreen.route());
            },
            leading: const Icon(
              Icons.history,
              color: ConfigColors.secondary,
            ),
            title: const AppText.paragraphS16('Medical Records'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, SettingsScreen.route());
            },
            leading: const Icon(
              Icons.settings,
              color: ConfigColors.secondary,
            ),
            title: const AppText.paragraphS16('Settings'),
          ),
          const ListTile(
            leading: Icon(
              Icons.logout,
              color: ConfigColors.secondary,
            ),
            title: AppText.paragraphS16('Logout'),
          ),
          const Spacer(),
          const AppText.paragraphS14(
            'Version 0.1',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
