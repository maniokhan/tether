import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/common_widgets/common_button.dart';
import 'package:newtetherpets/src/common_widgets/common_card.dart';
import 'package:newtetherpets/src/common_widgets/common_password.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field.dart';
import 'package:newtetherpets/src/common_widgets/common_text_field_title.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/authentication/signup_screen.dart';
import 'package:newtetherpets/src/features/pet_owner/dashboard/dashboard_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SigninScreenState();
  // State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  // late final TextEditingController _emailController;

  // late final TextEditingController _passwordController;

  // @override
  // void initState() {
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              height: MediaQuery.of(context).size.height * 0.15,
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
            const AppText.titleS24('Welcome Back!'),
            gapH4,
            const AppText.paragraphI14('Please log in to continue.'),
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
            gapH28,
            CommonTextFieldTitle(
              leading: Assets.lock.svg(color: ConfigColors.primary),
              text: 'Password',
            ),
            gapH8,
            const CommonPasswordInput(),
            gapH32,
            CommonButton(
              text: 'Log In',
              onPress: () => Navigator.push(context, DashBoardScreen.route()),
            ),
            gapH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText.paragraphI12(
                  "Don't have an account yet? ",
                  fontWeight: FontWeight.w500,
                  // fontSize: 12,
                  color: ConfigColors.lightText,
                ),
                InkWell(
                  onTap: () => Navigator.push(context, SignupScreen.route()),
                  child: const AppText.paragraphI12(
                    'Register here',
                    fontWeight: FontWeight.w700,
                    color: ConfigColors.primary,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            gapH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonCard(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(14),
                  customRadius: BorderRadius.circular(14),
                  showBorder: true,
                  child: Assets.facebook.svg(),
                ),
                gapW16,
                CommonCard(
                  alignment: Alignment.center,
                  customRadius: BorderRadius.circular(14),
                  padding: const EdgeInsets.all(14),
                  showBorder: true,
                  child: Assets.twitter.svg(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
