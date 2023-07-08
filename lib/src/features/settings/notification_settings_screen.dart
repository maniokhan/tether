import 'package:flutter/material.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});
  static MaterialPageRoute<NotificationSettingsScreen> route() {
    return MaterialPageRoute<NotificationSettingsScreen>(
      builder: (BuildContext context) => const NotificationSettingsScreen(),
    );
  }

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool pushNotificationSwitchValue = false;
  bool emailNotificationSwitchValue = false;
  bool smsNotificationSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConfigColors.primary,
        centerTitle: true,
        title: const AppText.titleS20(
          'Notification',
          color: ConfigColors.white,
        ),
      ),
      body: Column(
        children: [
          CommonSettingNotificationTile(
            height: 130,
            name: 'Push Notifications',
            description:
                'Receive push notification for\nappointment confirmations, reminders,\nand pet pickups.',
            switchValue: pushNotificationSwitchValue,
            onSwitchTap: (bool value) {
              setState(() {
                pushNotificationSwitchValue = value;
              });
            },
          ),
          CommonSettingNotificationTile(
            height: 130,
            name: 'Email Notifications',
            description:
                'Receive an email notification for\nappointment confirmations, reminders,\nand pet pickups.',
            switchValue: emailNotificationSwitchValue,
            onSwitchTap: (bool value) {
              setState(() {
                emailNotificationSwitchValue = value;
              });
            },
          ),
          CommonSettingNotificationTile(
            height: 165,
            name: 'SMS Notifications',
            description:
                'Receive an SMS for appointment\nreminders and pet pickups. Message\nand data rates apply. Message\nfrequency varies. Text HELP for\nhelp, STOP to cancel.',
            switchValue: smsNotificationSwitchValue,
            onSwitchTap: (bool value) {
              setState(() {
                smsNotificationSwitchValue = value;
              });
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CommonButton(
              text: 'Save',
              onPress: () {},
            ),
          ),
          gapH48,
        ],
      ),
    );
  }
}

class CommonSettingNotificationTile extends StatefulWidget {
  const CommonSettingNotificationTile({
    required this.name,
    required this.description,
    required this.switchValue,
    required this.onSwitchTap,
    required this.height,
    super.key,
  });
  final String name;
  final String description;
  final bool switchValue;
  final double height;

  final Function(bool)? onSwitchTap;

  @override
  State<CommonSettingNotificationTile> createState() =>
      _CommonSettingNotificationTileState();
}

class _CommonSettingNotificationTileState
    extends State<CommonSettingNotificationTile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ConfigColors.black,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gapW20,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH18,
              AppText.paragraphS16(widget.name),
              gapH26,
              Expanded(
                child: AppText.paragraphI14(
                  widget.description,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.blueGrey,
                ),
              ),
            ],
          ),
          Switch(
            value: widget.switchValue,
            onChanged: widget.onSwitchTap,
          ),
        ],
      ),
    );
  }
}
