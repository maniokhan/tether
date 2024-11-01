import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_textfield_dropdown.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/chat_screen.dart';
import 'package:newtetherpets/src/features/notification/notification_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

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
  List<String> speciesList = [
    'Dog',
    'Cat',
    'Bird',
  ];
  String selectedSpeciesValue = 'Dog';
  void onSpeciesValueChanged(String? value) {
    setState(() {
      selectedSpeciesValue = value!;
    });
    print(selectedSpeciesValue);
  }

  List<String> breedList = [
    'Golden Retriever',
    'Beagle',
    'Labrador Retriever',
    'German Shepherd',
    'Boxer',
  ];
  String selectedBreedValue = 'Golden Retriever';
  void onBreedValueChanged(String? value) {
    setState(() {
      selectedBreedValue = value!;
    });
    print(selectedBreedValue);
  }

  List<String> genderList = [
    'Male',
    'Female',
  ];
  String selectedgenderValue = 'Male';
  void onGenderValueChanged(String? value) {
    setState(() {
      selectedgenderValue = value!;
    });
    print(selectedgenderValue);
  }

  DateTime _selectedDate = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((DateTime? value) {
      setState(() {
        _selectedDate = value!;
      });
    });
  }

  bool actualCheckboxValue = true;
  bool estimateCheckboxValue = false;

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
                  showBorder: true,
                  prefixIcon: Assets.nameIcon.svg(),
                ),
                gapH20,
                const AppText.paragraphS16('Nickname'),
                gapH8,
                CommonTextField(
                  hintText: 'Add Nickname',
                  showBorder: true,
                  prefixIcon: Assets.nickNameIcon.svg(),
                ),
                gapH20,
                const AppText.paragraphS16('Species'),
                gapH8,
                CommonDropdown(
                  svgIcon: Assets.speciesIcon.svg(
                    height: 18,
                    color: ConfigColors.black,
                  ),
                  initialValue: selectedSpeciesValue,
                  onValueChanged: onSpeciesValueChanged,
                  listofDropdown: speciesList,
                ),
                gapH20,
                const AppText.paragraphS16('Breed'),
                gapH8,
                CommonDropdown(
                  svgIcon: Assets.dogIcon.svg(
                    height: 18,
                    color: ConfigColors.black,
                  ),
                  initialValue: selectedBreedValue,
                  onValueChanged: onBreedValueChanged,
                  listofDropdown: breedList,
                ),
                gapH20,
                const AppText.paragraphS16('Gender'),
                gapH8,
                CommonDropdown(
                  svgIcon: Assets.prefix.svg(
                    height: 18,
                    color: ConfigColors.black,
                  ),
                  initialValue: selectedgenderValue,
                  onValueChanged: onGenderValueChanged,
                  listofDropdown: genderList,
                ),
                gapH20,
                const AppText.paragraphS16('Birth Date'),
                gapH8,
                GestureDetector(
                  onTap: _showDatePicker,
                  child: Container(
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
                        Assets.dateTime.svg(
                          height: 18,
                          color: ConfigColors.black,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        AppText.paragraphI16(
                          '${_selectedDate.day} ${DateFormat('MMM').format(_selectedDate)} ${_selectedDate.year}',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                gapH4,
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      const Spacer(),
                      Checkbox(
                        checkColor: Colors.white,
                        value: actualCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            actualCheckboxValue = true;
                            estimateCheckboxValue = false;
                          });
                        },
                      ),
                      const AppText.paragraphI14(
                        'Actual',
                        fontWeight: FontWeight.w500,
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        value: estimateCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            estimateCheckboxValue = true;
                            actualCheckboxValue = false;
                          });
                        },
                      ),
                      const AppText.paragraphI14(
                        'Estimate',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const AppText.paragraphS16('Weight'),
                gapH8,
                CommonTextField(
                  hintText: 'Add Weight',
                  showBorder: true,
                  prefixIcon: Assets.weightIcon.svg(),
                ),
                gapH20,
                const AppText.paragraphS16('Attributes'),
                gapH8,
                Container(
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
                      Checkbox(
                        checkColor: Colors.white,
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      const AppText.paragraphI14(
                        'Long Hair',
                        fontWeight: FontWeight.w500,
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      const AppText.paragraphI14(
                        'Skin Allergies',
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 38,
                        color: ConfigColors.primary,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                    ],
                  ),
                ),
                gapH32,
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
                gapH54,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
