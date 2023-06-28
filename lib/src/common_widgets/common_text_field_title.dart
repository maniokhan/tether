// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tetherapp1/src/theme/text.dart';

class CommonTextFieldTitle extends StatelessWidget {
  final Widget leading;
  final String text;
  final Color? textColor;
  const CommonTextFieldTitle({
    required this.leading,
    required this.text,
    super.key,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const SizedBox(width: 12),
        AppText.paragraphI16(text, color: textColor),
      ],
    );
  }
}
