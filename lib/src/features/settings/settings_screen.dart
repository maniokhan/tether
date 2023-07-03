import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/settings/help_center_screen.dart';
import 'package:newtetherpets/src/features/settings/notification_settings_screen.dart';
import 'package:newtetherpets/src/features/settings/privacy_policy_screen.dart';
import 'package:newtetherpets/src/features/settings/terms_of_use_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

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
      body: Column(
        children: [
          gapH32,
          CommonSettingsTile(
            icon: Assets.notofication.svg(
              height: 24,
              color: ConfigColors.black,
            ),
            settingsName: 'Notifications',
            onTap: () {
              Navigator.push(context, NotificationSettingsScreen.route());
            },
          ),
          const CommonSettingsTile(
            icon: Icon(
              CupertinoIcons.paw_solid,
              color: ConfigColors.black,
            ),
            settingsName: 'Inactive Pets',
          ),
          CommonSettingsTile(
            icon: Assets.appointment.svg(
              height: 24,
              color: ConfigColors.black,
            ),
            settingsName: 'Appointment History',
          ),
          CommonSettingsTile(
            icon: const Icon(
              CupertinoIcons.question,
              color: ConfigColors.black,
            ),
            settingsName: 'Help Center',
            onTap: () {
              Navigator.push(context, HelpCenterScreen.route());
            },
          ),
          CommonSettingsTile(
            icon: const Icon(
              Icons.privacy_tip_outlined,
              color: ConfigColors.black,
            ),
            settingsName: 'Privacy Policy',
            onTap: () {
              Navigator.push(context, PrivacyPolicy.route());
            },
          ),
          CommonSettingsTile(
            icon: const Icon(
              CupertinoIcons.doc_text,
              color: ConfigColors.black,
            ),
            settingsName: 'Terms of Use',
            onTap: () {
              Navigator.push(context, TermsOfUse.route());
            },
          ),
          const CommonSettingsTile(
            icon: Icon(
              Icons.mail_outline_outlined,
              color: ConfigColors.black,
            ),
            settingsName: 'PetDesk Mobile App Support',
          ),
          const Spacer(),
          const AppText.paragraphS14(
            'Version 0.1',
            textAlign: TextAlign.center,
          ),
          gapH24,
        ],
      ),
    );
  }
}

class CommonSettingsTile extends StatelessWidget {
  const CommonSettingsTile({
    required this.icon,
    required this.settingsName,
    this.onTap,
    super.key,
  });
  final Widget icon;
  final String settingsName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ConfigColors.blueGrey,
              spreadRadius: 1,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            gapW24,
            icon,
            gapW16,
            AppText.paragraphS16(settingsName),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ConfigColors.blueGrey,
              size: 20,
            ),
            gapW12,
          ],
        ),
      ),
    );
  }
}
