import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_button.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/chat_screen.dart';
import 'package:tether_pet_owner/src/features/notification/notification_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class DetailPetScreen extends StatefulWidget {
  const DetailPetScreen({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const DetailPetScreen(),
    );
  }

  @override
  State<DetailPetScreen> createState() => _DetailPetScreenState();
}

class _DetailPetScreenState extends State<DetailPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Details',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            Assets.dog1.path,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText.paragraphS16('Name'),
                gapH8,
                CommonTextField(
                  hintText: 'Add Full Name (First,Last)',
                  textInputType: TextInputType.emailAddress,
                  showBorder: true,
                  prefixIcon: Assets.message.svg(),
                ),
                CommonButton(
                  text: 'Save Changes',
                  onPress: () {},
                ),
                gapH20,
                CommonButton(
                  synappButtonColor: SynappButtonColor.red,
                  text: 'Remove Pet',
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
