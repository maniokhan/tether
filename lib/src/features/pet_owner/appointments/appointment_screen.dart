import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_appointment_tile.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        //  automaticallyImplyLeading: false,
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
          'Appointments',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: <Widget>[
          CommonAppointmentTile(
            image: Assets.doctor4.path,
            name: 'Dr. William Watt',
            providerStatus: 'Verterinarian',
            date: 'Monday, Jan 20',
            time: '08:00am',
          ),
          gapH12,
          CommonAppointmentTile(
            image: Assets.doctor2.path,
            name: 'Pro Grooming',
            providerStatus: 'Grooming',
            date: 'Monday, Jan 24',
            time: '09:00am',
          ),
          gapH12,
          CommonAppointmentTile(
            image: Assets.doctor3.path,
            name: 'Ultra Boarding',
            providerStatus: 'Boarder',
            date: 'Monday, Mar 16',
            time: '01:00pm',
          ),
        ],
      ),
    );
  }
}
