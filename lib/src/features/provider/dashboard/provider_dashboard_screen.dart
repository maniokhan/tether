import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_appointment_tile.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_tile.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/chat_screen.dart';
import 'package:newtetherpets/src/features/notification/notification_screen.dart';
import 'package:newtetherpets/src/features/provider/appointments/provider_appointments_screen.dart';
import 'package:newtetherpets/src/features/provider/dashboard/drawer_screen.dart';
import 'package:newtetherpets/src/features/provider/patients/patients_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const DashBoardScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 3,
        height: 66,
        backgroundColor: ConfigColors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Assets.home.svg(
              color: ConfigColors.secondary,
              height: 25,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Assets.patientsIcon.svg(
              color: ConfigColors.secondary,
              height: 25,
            ),
            label: 'patients',
          ),
          NavigationDestination(
            icon: Assets.appointment.svg(
              color: ConfigColors.secondary,
              height: 25,
            ),
            label: 'Appointments',
          ),
        ],
      ),
      body: <Widget>[
        const HomeView(),
        const PatientScreen(),
        const AppointmentScreen(),
      ][currentPageIndex],
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          'Dashboard',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: <Widget>[
          gapH20,
          const Row(
            children: [
              AppText.paragraphI16(
                'Notifications',
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              InkWell(
                child: AppText.paragraphI12(
                  'See all',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          gapH20,
          const CommonTile(
            text: 'From: Goodwin Animal Clinic',
            date: 'Date: June 15, 2023',
            timeAgo: '17 hours ago',
          ),
          gapH20,
          const Row(
            children: [
              AppText.paragraphI16(
                'Messages',
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              InkWell(
                child: AppText.paragraphI12(
                  'See all',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          gapH20,
          const CommonTile(
            text: 'From: Taylor Gooch',
            date: 'Date: June 14, 2023',
            timeAgo: '1 day ago',
          ),
          gapH20,
          const Row(
            children: [
              AppText.paragraphI16(
                'Upcoming Appointments',
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              InkWell(
                child: AppText.paragraphI12(
                  'See all',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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
          gapH20,
          CommonAppointmentTile(
            image: Assets.doctor4.path,
            name: 'Cameron Smith',
            date: 'Monday, Jan 20',
            time: '08:00am',
          ),
          gapH20,
          CommonAppointmentTile(
            image: Assets.doctor2.path,
            name: 'Taylor Gooch',
            date: 'Monday, Jan 20',
            time: '09:00am',
          ),
          gapH20,
        ],
      ),
    );
  }
}
