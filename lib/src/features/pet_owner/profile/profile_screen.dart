import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field_title.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/chat_screen.dart';
import 'package:newtetherpets/src/features/notification/notification_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static MaterialPageRoute<ProfileScreen> route() {
    return MaterialPageRoute<ProfileScreen>(
      builder: (BuildContext context) => const ProfileScreen(),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Profile',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        // physics: const BouncingScrollPhysics(),
        children: <Widget>[
          gapH20,
          Container(
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.doctor1.path),
              ),
            ),
          ),
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.name.svg(color: ConfigColors.primary),
            text: 'Name',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Add Full Name (First,Last)',
            showBorder: true,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.emailGreen.svg(color: ConfigColors.primary),
            text: 'Email',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Add Email Address',
            textInputType: TextInputType.emailAddress,
            showBorder: true,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.phoneNumber.svg(color: ConfigColors.primary),
            text: 'Phone Number',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Add Phone Number',
            textInputType: TextInputType.phone,
            showBorder: true,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.address.svg(color: ConfigColors.primary),
            text: 'Address',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Enter Address',
            textInputType: TextInputType.streetAddress,
            largeField: true,
            showBorder: true,
          ),
          gapH32,
          CommonButton(
            text: 'Save',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
