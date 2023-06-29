import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/provider/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  List<String> daysNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  int selectedContainerIndex = -1;
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
          'Appointments',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: <Widget>[
          gapH20,
          const AppText.paragraphI16(
            'Appointment Date',
            fontWeight: FontWeight.w600,
          ),
          gapH20,
          Row(
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: CommonFieldState.idle.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.paragraphI16(
                      'June',
                      fontWeight: FontWeight.w400,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 32,
                      color: ConfigColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          gapH20,
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                if (index == 6) {
                  return const Icon(
                    Icons.arrow_forward_rounded,
                    color: ConfigColors.primary,
                    size: 25,
                  );
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: ConfigColors.white,
                      border: Border.all(color: ConfigColors.black),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.paragraphI10(
                          daysNames[index],
                          fontWeight: FontWeight.w500,
                          color: selectedContainerIndex == index
                              ? ConfigColors.primary
                              : ConfigColors.black,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Divider(
                            color: ConfigColors.black,
                            thickness: 1,
                          ),
                        ),
                        AppText.paragraphI10(
                          '0${index + 1}',
                          fontWeight: FontWeight.w500,
                          color: selectedContainerIndex == index
                              ? ConfigColors.primary
                              : ConfigColors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          gapH12,
          const Divider(
            color: ConfigColors.primary,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
