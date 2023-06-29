import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_card.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/provider/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: ConfigColors.primary,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, ChatScreen.route());
            },
            icon: Assets.message.svg(
              height: 18,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, NotificationScreen.route());
            },
            icon: Assets.notofication.svg(
              height: 18,
            ),
          ),
        ],
        title: const AppText.paragraphS16(
          'Patients',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: <Widget>[
          gapH24,
          const CommonTextField(
            showBorder: true,
            hintText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
          gapH20,
          CommonPatientsCard(
            name: 'Maria J.k',
            patientImage: Assets.doctor1.path,
          ),
          gapH20,
          CommonPatientsCard(
            name: 'Roben Lucas',
            patientImage: Assets.doctor3.path,
          ),
        ],
      ),
    );
  }
}

class CommonPatientsCard extends StatelessWidget {
  const CommonPatientsCard({
    required this.name,
    required this.patientImage,
    super.key,
  });
  final String name;
  final String patientImage;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(patientImage),
              ),
            ),
          ),
          gapW20,
          AppText.paragraphS16(name),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_rounded,
            color: ConfigColors.primary,
          ),
          gapW20,
        ],
      ),
    );
  }
}
