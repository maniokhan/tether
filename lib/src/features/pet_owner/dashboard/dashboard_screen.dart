import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_appointment_tile.dart';
import 'package:tether_pet_owner/src/common_widgets/common_tile.dart';
import 'package:tether_pet_owner/src/common_widgets/provider_tile.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/appointments/appointment_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/pets/pet_screen.dart';
import 'package:tether_pet_owner/src/features/pet_owner/providers_screen.dart';
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
      body: <Widget>[
        const HomeView(),
        PetScreen(),
        const ProvidersScreen(),
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
          CommonAppointmentTile(
            image: Assets.doctor4.path,
            name: 'Dr. William Watt',
            providerStatus: 'Verterinarian',
            date: 'Monday, Jan 20',
            time: '08:00am',
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
          ProviderTile(
            providerImage: Assets.doctor1.path,
            providerName: 'Dr. Maria J.K',
            providerStatus: 'Veterinarian',
            rating: 5.0,
            noOfReviews: 62,
          ),
          ProviderTile(
            providerImage: Assets.doctor2.path,
            providerName: 'Dr.  Roberto Williams',
            providerStatus: 'Veterinarian',
            rating: 4.0,
            noOfReviews: 45,
          ),
          ProviderTile(
            providerImage: Assets.doctor3.path,
            providerName: 'Dr. Peter Long',
            providerStatus: 'Gynecologist',
            rating: 4.5,
            noOfReviews: 82,
          ),
        ],
      ),
    );
  }
}
