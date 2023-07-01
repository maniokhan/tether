import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field_title.dart';
import 'package:newtetherpets/src/common_widgets/common_textfield_dropdown.dart';
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
  List<String> daysNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String> availabilityTiminig = [
    '9am - 5pm',
    '9am - 5pm',
    '9am - 5pm',
    '9am - 5pm',
    '9am - 5pm',
    '10am - 3pm',
    'Closed',
  ];
  List<String> servicesList = [
    'Veterinary',
    'Groomer',
    'Boarder',
  ];
  String selectedServicesValue = 'Veterinary';
  void onServicesValueChanged(String? value) {
    setState(() {
      selectedServicesValue = value!;
    });
    print(selectedServicesValue);
  }

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
            leading: Assets.businessIcon.svg(color: ConfigColors.primary),
            text: 'Business Name',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Add Business Name',
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
            leading: Assets.websiteIcon.svg(color: ConfigColors.primary),
            text: 'Website',
          ),
          gapH8,
          const CommonTextField(
            hintText: 'Add Website',
            textInputType: TextInputType.url,
            showBorder: true,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.servicesIcon.svg(color: ConfigColors.primary),
            text: 'Services',
          ),
          gapH8,
          CommonDropdown(
            initialValue: selectedServicesValue,
            onValueChanged: onServicesValueChanged,
            listofDropdown: servicesList,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.address.svg(color: ConfigColors.primary),
            text: 'Address',
          ),
          gapH8,
          const CommonTextField(
            hintText: '(Street)',
            textInputType: TextInputType.streetAddress,
            showBorder: true,
            shortField: true,
          ),
          gapH8,
          const CommonTextField(
            hintText: '(city)',
            textInputType: TextInputType.streetAddress,
            showBorder: true,
            shortField: true,
          ),
          gapH8,
          const CommonTextField(
            hintText: '(State)',
            textInputType: TextInputType.streetAddress,
            showBorder: true,
            shortField: true,
            suffixIcon: Icon(
              Icons.arrow_drop_down_rounded,
              size: 32,
            ),
          ),
          gapH8,
          const CommonTextField(
            hintText: '(Zip Code)',
            textInputType: TextInputType.streetAddress,
            showBorder: true,
            shortField: true,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.availabilityIcon.svg(color: ConfigColors.primary),
            text: 'Availability',
          ),
          gapH8,
          SizedBox(
            height: 340,
            width: double.infinity,
            child: ListView.builder(
              itemCount: daysNames.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gapW32,
                      AppText.paragraphS14(
                        daysNames[index],
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      Container(
                        height: 25,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ConfigColors.backgroundGrey,
                          border: Border.all(
                            color: ConfigColors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: AppText.paragraphS14(
                          availabilityTiminig[index],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      gapW32,
                    ],
                  ),
                );
              },
            ),
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
