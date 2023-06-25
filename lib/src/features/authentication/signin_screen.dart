import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_password.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field_title.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const SigninScreen(),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

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
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.tetherLogo.path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CommonTextFieldTitle(
              leading: Assets.emailGreen.svg(color: ConfigColors.primary),
              text: 'Email',
            ),
            const SizedBox(
              height: 8,
            ),
            const CommonTextField(
              hintText: 'Add Email Address',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CommonTextFieldTitle(
              leading: Assets.lock.svg(),
              text: 'Password',
            ),
            const SizedBox(
              height: 8,
            ),
            // TODO (abubakar): here is the erro
            const CommonPasswordInput(),
          ],
        ),
      ),
    );
  }
}
