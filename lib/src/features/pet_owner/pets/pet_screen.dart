import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_card.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/chat_screen.dart';
import 'package:newtetherpets/src/features/notification/notification_screen.dart';
import 'package:newtetherpets/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class PetScreen extends StatelessWidget {
  PetScreen({super.key});

  @override
  List<String> images = [
    Assets.dog1.path,
    Assets.dog2.path,
    Assets.dog3.path,
  ];
  List<String> names = [
    'Diana',
    'Emily',
    'Izzy',
  ];

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
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images != null ? images.length + 1 : 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < images.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          gapH4,
                          AppText.paragraphS14(names[index]),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(
                        bottom: 30,
                      ),
                      child: const CommonCard(
                        shape: BoxShape.circle,
                        showBorder: true,
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.add,
                          color: ConfigColors.primary,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
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
                      Assets.dog1.path,
                      fit: BoxFit.cover,
                      height: 190,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText.paragraphS16(
                          'Diana',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Assets.prefix.svg(
                              height: 20,
                            ),
                            gapW12,
                            const AppText.paragraphI14(
                              'Male',
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            Assets.appointment.svg(
                              color: ConfigColors.primary,
                              height: 25,
                            ),
                            gapW12,
                            const AppText.paragraphI14(
                              '4 years old',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        gapH20,
                        Row(
                          children: [
                            Assets.dogIcon.svg(
                              height: 20,
                            ),
                            const SizedBox(width: 12),
                            const AppText.paragraphI14(
                              'Golden Retriever',
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            const AppText.paragraphI14(
                              '12 lbs',
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        gapH16,
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
                  ListTile(
                    leading: Assets.medicalRecords.svg(
                      height: 22,
                    ),
                    title: const AppText.paragraphI16(
                      'Medical Records',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 22,
                    ),
                  ),
                  ListTile(
                    leading: Assets.prescription.svg(
                      height: 22,
                    ),
                    title: const AppText.paragraphI16(
                      'Prescription',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 22,
                    ),
                  ),
                  ListTile(
                    leading: Assets.labResults.svg(
                      height: 22,
                    ),
                    title: const AppText.paragraphI16(
                      'Lab Results',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 22,
                    ),
                  ),
                  ListTile(
                    leading: Assets.chipAndTag.svg(
                      height: 22,
                    ),
                    title: const AppText.paragraphI16(
                      'Chip and Tag',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 22,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Assets.medicalRecords.svg(
                  //       height: 22,
                  //     ),
                  //     gapW12,
                  //     const AppText.paragraphI16(
                  //       'Medical Records',
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 18,
                  //     ),
                  //   ],
                  // ),
                  // gapH16,
                  // Row(
                  //   children: [
                  //     Assets.prescription.svg(
                  //       height: 22,
                  //     ),
                  //     gapW12,
                  //     const AppText.paragraphI16(
                  //       'Prescriptions',
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 18,
                  //     ),
                  //   ],
                  // ),
                  // gapH16,
                  // Row(
                  //   children: [
                  //     Assets.labResults.svg(
                  //       height: 22,
                  //     ),
                  //     gapW12,
                  //     const AppText.paragraphI16(
                  //       'Lab Results',
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 18,
                  //     ),
                  //   ],
                  // ),
                  // gapH16,
                  // Row(
                  //   children: [
                  //     Assets.chipAndTag.svg(
                  //       height: 22,
                  //     ),
                  //     gapW12,
                  //     const AppText.paragraphI16(
                  //       'Chip and Tag',
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 18,
                  //     ),
                  //  ],
                  //),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
