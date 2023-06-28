import 'package:flutter/material.dart';
import 'package:tetherapp1/src/common_widgets/common_card.dart';
import 'package:tetherapp1/src/constants/app_sizes.dart';
import 'package:tetherapp1/src/theme/text.dart';

class CommonTile extends StatelessWidget {
  const CommonTile({
    required this.text,
    required this.date,
    required this.timeAgo,
    super.key,
    this.onTap,
  });
  final String text;
  final String date;
  final String timeAgo;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CommonCard(
        height: 77,
        alignment: Alignment.center,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.paragraphI14(
                  text,
                  color: Colors.black87,
                ),
                gapH4,
                Row(
                  children: [
                    AppText.paragraphI14(
                      date,
                      color: Colors.black87,
                    ),
                    gapW64,
                    AppText.paragraphI10(
                      timeAgo,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
