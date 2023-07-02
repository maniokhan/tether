import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_button.dart';
import 'package:tether_pet_owner/src/common_widgets/common_card.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/pet_owner/dashboard/dashboard_screen.dart';
import 'package:tether_pet_owner/src/features/provider/dashboard/provider_dashboard_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';
=======
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_card.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';
>>>>>>> 50ec7c09c7b606e2e79a09599775aba7f0b8827f

enum Role { petOwner, provider }

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({super.key});
  static Route<UserRoleScreen> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const UserRoleScreen(),
    );
  }

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  Role selcectedRole = Role.petOwner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ConfigColors.primary,
        centerTitle: true,
        title: const AppText.titleS20(
          'Tether',
          color: ConfigColors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.tetherLogo.path,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          gapH12,
          const Center(
            child: Column(
              children: [
                AppText.titleS24(
                  'Select role',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                gapH8,
                AppText.paragraphI14(
                  'Please select your role in the app.',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: ConfigColors.slateGray,
                ),
              ],
            ),
          ),
          gapH32,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonCard(
              onTap: () {
                setState(() {
                  selcectedRole = Role.petOwner;
                });
              },
              alignment: Alignment.center,
              showBorder: selcectedRole == Role.petOwner ? true : false,
              borderColor:
                  selcectedRole == Role.petOwner ? ConfigColors.primary : null,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Assets.petOwner.svg(
                    height: 50,
                    color: selcectedRole == Role.petOwner
                        ? ConfigColors.primary
                        : ConfigColors.slateGray,
                  ),
                  gapH8,
                  AppText.paragraphI16(
                    'Pet Owner',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: selcectedRole == Role.petOwner
                        ? ConfigColors.primary
                        : ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
          ),
          gapH20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonCard(
              onTap: () {
                setState(() {
                  selcectedRole = Role.provider;
                });
              },
              alignment: Alignment.center,
              showBorder: selcectedRole == Role.provider ? true : false,
              padding: const EdgeInsets.symmetric(vertical: 40),
              borderColor:
                  selcectedRole == Role.provider ? ConfigColors.primary : null,
              child: Column(
                children: [
                  // TODO:  Client icon not shown
                  Assets.provider.svg(
                    height: 50,
                    color: selcectedRole == Role.provider
                        ? ConfigColors.primary
                        : ConfigColors.slateGray,
                  ),
                  gapH8,
                  AppText.paragraphI16(
                    'Provider',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: selcectedRole == Role.provider
                        ? ConfigColors.primary
                        : ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonButton(
              text: 'Continue',
              onPress: () {
                if (selcectedRole == Role.petOwner) {
                  Navigator.push(context, DashBoardScreen.route());
                }
                if (selcectedRole == Role.provider) {
                  Navigator.push(context, ProviderDashBoardScreen.route());
                }
              },
            ),
          ),
          gapH20,
        ],
      ),
    );
  }
}
