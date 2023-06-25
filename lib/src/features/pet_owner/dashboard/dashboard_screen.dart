import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_card.dart';
import 'package:tether_pet_owner/src/common_widgets/common_tile.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/appointments/appointment_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/pets/pet_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const DashBoardScreen(),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
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
          const NavigationDestination(
            icon: Icon(
              CupertinoIcons.paw_solid,
              color: ConfigColors.secondary,
            ),
            label: 'Pets',
          ),
          //  NavigationDestination(
          //   icon: Assets.home.svg(
          //     color: ConfigColors.secondary,
          //   ),
          //   label: 'Providers',
          // ),
          NavigationDestination(
            icon: Assets.checkup.svg(
              color: ConfigColors.secondary,
              height: 25,
            ),
            label: 'checkup',
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
              height: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, NotificationScreen.route());
            },
            icon: Assets.notofication.svg(
              height: 20,
            ),
          ),
        ],
        title: const AppText.titleS20(
          'Dashboard',
          color: Colors.white,
        ),
      ),
      body: <Widget>[
        const HomeView(),
        const PetScreen(),
        // const ProvidersScreen(),
        ChatScreen(),
        const AppointmentScreen(),
      ][currentPageIndex],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      children: <Widget>[
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
        CommonCard(
          height: 170,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.doctor4.path),
                ),
                title: const AppText.paragraphI16(
                  'Dr. William Watt',
                  // fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: const AppText.paragraphI14(
                  'Verterinarian',
                  color: Colors.black54,
                ),
              ),
              gapH8,
              CommonCard(
                height: 50,
                backgroundColor: ConfigColors.primary,
                child: Row(
                  children: [
                    Assets.dateTime.svg(
                      height: 16,
                    ),
                    gapW4,
                    const AppText.paragraphI12(
                      'Monday, Jan 20',
                      color: ConfigColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Assets.clock.svg(
                      height: 16,
                    ),
                    gapW4,
                    const AppText.paragraphI12(
                      '08:00am',
                      color: ConfigColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
          text: 'Pro Grooming',
          date: 'Date: June 13, 2023',
          timeAgo: '2 dayss ago',
        ),
        gapH20,
        const Row(
          children: [
            AppText.paragraphI16(
              'Top Providers',
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
        CommonCard(
          height: 80,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(Assets.doctor1.path),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
