// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/common_widgets/common_password.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field_title.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/authentication/user_role_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const SignupScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.tetherLogo.path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            gapH16,
            const AppText.titleS24('Register'),
            gapH4,
            const AppText.paragraphI14('Please register to continue.'),
            gapH24,
            CommonTextFieldTitle(
              leading: Assets.prefix.svg(color: ConfigColors.primary),
              text: 'Prefix',
            ),
            gapH8,
            const CommonTextField(
              hintText: 'Add Prefix',
              textInputType: TextInputType.text,
            ),
            gapH24,
            CommonTextFieldTitle(
              leading: Assets.name.svg(color: ConfigColors.primary),
              text: 'Name',
            ),
            gapH8,
            const CommonTextField(
              hintText: 'Add Full Name (First,Last)',
              textInputType: TextInputType.text,
            ),
            gapH24,
            CommonTextFieldTitle(
              leading: Assets.phoneNumber.svg(color: ConfigColors.primary),
              text: 'Phone Number',
            ),
            gapH8,
            const CommonTextField(
              hintText: 'Add Phone Number',
              textInputType: TextInputType.emailAddress,
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
            ),
            gapH24,
            CommonTextFieldTitle(
              leading: Assets.lock.svg(color: ConfigColors.primary),
              text: 'Password',
            ),
            gapH8,
            const CommonPasswordInput(),
            gapH24,
            CommonTextFieldTitle(
              leading: Assets.lock.svg(color: ConfigColors.primary),
              text: 'Confirm Password',
            ),
            gapH8,
            const CommonPasswordInput(),
            gapH18,
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: ConfigColors.primary,
                ),
                const AppText.paragraphI14(
                  'I agree with the terms and conditions',
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.slateGray,
                ),
              ],
            ),
            gapH24,
            CommonButton(
              text: 'Register',
              onPress: () => Navigator.push(context, UserRoleScreen.route()),
            ),
          ],
        ),
      ),
    );
  }
}
