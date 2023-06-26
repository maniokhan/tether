import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class CooperScreen extends StatelessWidget {
  const CooperScreen({super.key});

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
          'My Pets',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Container(
              // height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      Assets.persianCat1.path,
                      fit: BoxFit.cover,
                      height: 190,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    color: const Color.fromARGB(255, 220, 118, 238),
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.info_circle,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        AppText.paragraphS14(
                          'Discover Pet Insurance',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.paragraphS16(
                          'Cooper',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.male, size: 26),
                            SizedBox(width: 12),
                            AppText.paragraphI14(
                              'Male Neutered',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.hourglass_bottomhalf_fill,
                              size: 26,
                            ),
                            SizedBox(width: 12),
                            AppText.paragraphI14(
                              'Australian Shepherd',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.cake_outlined, size: 26),
                            SizedBox(width: 12),
                            AppText.paragraphI14(
                              '--',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.male, size: 26),
                            SizedBox(width: 12),
                            AppText.paragraphI14(
                              '48 lbs',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: AppText.paragraphS16(
                            'Complete Profile',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.blueAccent,
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.dashboard_customize_sharp),
                      ),
                      const SizedBox(width: 12),
                      const AppText.paragraphS16(
                        'Medical Records',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        color: Colors.purple,
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.description_rounded),
                      ),
                      const SizedBox(width: 12),
                      const AppText.paragraphS16(
                        'Prescriptions',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
