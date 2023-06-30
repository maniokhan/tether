import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({
    required this.initialValue,
    required this.onValueChanged,
    required this.listofDropdown,
    this.svgIcon,
    super.key,
  });
  final Widget? svgIcon;
  final String? initialValue;
  final Function(String?) onValueChanged;
  final List<String> listofDropdown;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  PopupMenuItem<String> buildPopupMenuItem(String value) {
    return PopupMenuItem<String>(
      value: value,
      child: AppText.paragraphI16(
        value,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: CommonFieldState.idle.backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: ConfigColors.black,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          const SizedBox(
            width: 14,
          ),
          if (widget.svgIcon != null) widget.svgIcon!,
          if (widget.svgIcon != null)
            const SizedBox(
              width: 14,
            ),
          AppText.paragraphI16(
            widget.initialValue!,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return widget.listofDropdown.map(buildPopupMenuItem).toList();
            },
            onSelected: (String value) {
              setState(() {
                selectedValue = value;
              });
              widget.onValueChanged(value);
            },
            child: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 38,
              color: ConfigColors.primary,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
    );
  }
}
