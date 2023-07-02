import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/provider_tile.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/chat_screen.dart';
import 'package:newtetherpets/src/features/notification/notification_screen.dart';
import 'package:newtetherpets/src/features/pet_owner/dashboard/drawer_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({super.key});

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

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
          'Providers',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH24,
            Container(
              //  margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 34,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 198, 221, 243),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TabBar(
                controller: tabController,
                unselectedLabelColor: ConfigColors.primary,
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  color: ConfigColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Groomer',
                  ),
                  Tab(
                    text: 'Vet',
                  ),
                  Tab(
                    text: 'Boarder',
                  ),
                ],
              ),
            ),
            gapH32,
            const AppText.paragraphS16('My Providers'),
            gapH20,
            ProviderTile(
              providerImage: Assets.doctor1.path,
              providerName: 'Dr. Maria J.K',
              providerStatus: 'Veterinarian',
              rating: 5.0,
              noOfReviews: 62,
              isFavorite: true,
            ),
            ProviderTile(
              providerImage: Assets.doctor2.path,
              providerName: 'Dr. Roberto Williams',
              providerStatus: 'Veterinarian',
              rating: 4.0,
              noOfReviews: 45,
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}
