import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_card.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class CommonAppointmentTile extends StatelessWidget {
  const CommonAppointmentTile({
    required this.image,
    required this.name,
    required this.providerStatus,
    required this.date,
    required this.time,
    super.key,
  });
  final String name;
  final String image;
  final String providerStatus;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      height: 170,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            title: AppText.paragraphI16(
              name,
              // fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            subtitle: AppText.paragraphI14(
              providerStatus,
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
                AppText.paragraphI12(
                  date,
                  color: ConfigColors.white,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                Assets.clock.svg(
                  height: 16,
                ),
                gapW4,
                AppText.paragraphI12(
                  time,
                  color: ConfigColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
