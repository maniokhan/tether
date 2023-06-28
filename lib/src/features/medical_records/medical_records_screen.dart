import 'package:flutter/material.dart';
import 'package:tetherapp1/src/theme/config_colors.dart';
import 'package:tetherapp1/src/theme/text.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});
  static MaterialPageRoute<MedicalRecordsScreen> route() {
    return MaterialPageRoute<MedicalRecordsScreen>(
      builder: (BuildContext context) => const MedicalRecordsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConfigColors.primary,
        title: const AppText.titleS20(
          'Medical Records',
          color: ConfigColors.white,
        ),
      ),
      body: const Center(
        child: Text('Medical Records'),
      ),
    );
  }
}
