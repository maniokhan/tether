import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});
  static MaterialPageRoute<PrivacyPolicy> route() {
    return MaterialPageRoute<PrivacyPolicy>(
      builder: (BuildContext context) => const PrivacyPolicy(),
    );
  }

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConfigColors.primary,
        title: const AppText.titleS20(
          'Privacy Policy',
          color: ConfigColors.white,
        ),
      ),
    );
  }
}
