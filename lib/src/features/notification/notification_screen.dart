import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/settings/notification_settings_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';
=======
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';
>>>>>>> 50ec7c09c7b606e2e79a09599775aba7f0b8827f

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, NotificationSettingsScreen.route());
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: ConfigColors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          gapH26,
          CommonNotificationTile(
            name: 'Watt Veterinary',
            description: '20% off ALL dog food July 2nd...',
            timeAgo: '28 seconds ago',
          ),
          CommonNotificationTile(
            name: 'Pro Grooming',
            description: 'We will be Closed July 4th...',
            timeAgo: '2 weeks ago',
          ),
        ],
      ),
    );
  }
}

class CommonNotificationTile extends StatelessWidget {
  const CommonNotificationTile({
    required this.name,
    required this.description,
    required this.timeAgo,
    super.key,
  });
  final String name;
  final String description;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ConfigColors.black,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gapW20,
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ConfigColors.primary,
            ),
            child: const Icon(
              Icons.person,
              color: ConfigColors.white,
            ),
          ),
          gapW20,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.paragraphS14(name),
              AppText.paragraphI14(
                description,
                fontWeight: FontWeight.w500,
              ),
              AppText.paragraphI12(
                timeAgo,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 16,
            color: ConfigColors.primary,
          ),
          gapW20,
        ],
      ),
    );
  }
}
