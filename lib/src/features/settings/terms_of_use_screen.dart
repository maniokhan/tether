import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});
  static MaterialPageRoute<TermsOfUse> route() {
    return MaterialPageRoute<TermsOfUse>(
      builder: (BuildContext context) => const TermsOfUse(),
    );
  }

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConfigColors.primary,
        title: const AppText.titleS20(
          'Terms of Use',
          color: ConfigColors.white,
        ),
      ),
    );
  }
}
