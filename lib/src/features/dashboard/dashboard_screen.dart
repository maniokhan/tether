import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tether_pet_owner/src/features/appointments/appointment_screen.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/dashboard/drawer_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/features/pets/pet_screen.dart';
import 'package:tether_pet_owner/src/features/providers/provider_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

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
        elevation: 3,
        height: 66,
        backgroundColor: ConfigColors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.home,
              color: ConfigColors.secondary,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.paw_solid,
              color: ConfigColors.secondary,
            ),
            label: 'Pets',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.home,
              color: ConfigColors.secondary,
            ),
            label: 'Providers',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.calendar_badge_plus,
              color: ConfigColors.secondary,
            ),
            label: 'Appointments',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.text_bubble,
              color: ConfigColors.secondary,
            ),
            label: 'Messages',
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
              Navigator.push(context, NotificationScreen.route());
            },
            icon: const Icon(Icons.notifications),
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
        const ProviderScreen(),
        const AppointmentScreen(),
        ChatScreen(),
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
      children: const <Widget>[
        AppText.paragraphI16('Health Update'),
        AppText.paragraphI16('Upcoming Appointments'),
        AppText.paragraphI16('Recent messages'),
        AppText.paragraphI16('notifications'),
      ],
    );
  }
}
