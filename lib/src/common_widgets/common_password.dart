import 'package:flutter/material.dart';
import 'package:tetherapp1/src/common_widgets/check_password.dart';
import 'package:tetherapp1/src/common_widgets/common_error_card.dart';
import 'package:tetherapp1/src/common_widgets/common_text_field.dart';
import 'package:tetherapp1/src/utilities/extensions.dart';
import 'package:tetherapp1/src/utilities/requirement.dart';

class CommonPasswordInput extends StatefulWidget {
  const CommonPasswordInput({
    super.key,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validator,
    this.confirmPassword = false,
    this.checkPassword = false,
    this.focusNode,
  });
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  final bool confirmPassword;
  final bool checkPassword;
  final FocusNode? focusNode;

  @override
  State<CommonPasswordInput> createState() => _CommonPasswordInputState();
}

class _CommonPasswordInputState extends State<CommonPasswordInput> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _samePassword = true;

  IconData _suffixIcon = Icons.visibility_off;
  IconData _suffixConfirmIcon = Icons.visibility_off;

  String password = '';

  @override
  Widget build(BuildContext context) {
    // final AppLocalizations l10n = context.l10n;

    return Column(
      children: <Widget>[
        CommonTextField(
          focusNode: widget.focusNode,
          hintText: 'Enter Password',
          suffixIcon: _suffixIcon,
          obscureText: _obscureText,
          onChanged: (String newPassword) {
            setState(() {
              password = newPassword;
            });
          },
          onSuffixIconPressed: () {
            setState(() {
              _obscureText = !_obscureText;
              if (_obscureText) {
                _suffixIcon = Icons.visibility_off;
              } else {
                _suffixIcon = Icons.visibility;
              }
            });
          },
          autovalidateMode: widget.autovalidateMode,
          validator: (String? newPassword) {
            if (widget.validator != null) {
              return widget.validator!(newPassword);
            }
            return null;
          },
        ),
        if (widget.confirmPassword) ...<Widget>[
          const SizedBox(height: 16),
          CommonTextField(
            hintText: 'Enter Confirm Password',
            suffixIcon: _suffixConfirmIcon,
            obscureText: _obscureConfirmText,
            onSuffixIconPressed: () {
              setState(() {
                _obscureConfirmText = !_obscureConfirmText;
                if (_obscureConfirmText) {
                  _suffixConfirmIcon = Icons.visibility_off;
                } else {
                  _suffixConfirmIcon = Icons.visibility;
                }
              });
            },
            autovalidateMode: widget.autovalidateMode,
            validator: (String? newPassword) {
              if (newPassword != password) {
                _samePassword = false;
                return StringX.errorWithoutMessage;
              } else {
                _samePassword = true;
              }
              if (widget.validator!(newPassword) != null) {
                return StringX.errorWithoutMessage;
              }
              return null;
            },
          ),
          if (!_samePassword) ...<Widget>[
            const SizedBox(height: 16),
            const SynappErrorCard(
              text: 'Second Password is Different',
              emoji: '⚠️',
            ),
          ],
        ],
        if (widget.checkPassword) ...<Widget>[
          const SizedBox(height: 16),
          CheckPasswordWidget(
            password: password,
            requirements: const <Requirement>[
              Requirement.atLeast12Character,
              Requirement.oneDigit,
              Requirement.oneSpecialCharacter,
              Requirement.oneUppercaseLetter
            ],
          )
        ],
      ],
    );
  }
}

class SynappPasswordInputForm extends StatelessWidget {
  const SynappPasswordInputForm({
    required this.textFormFieldKey,
    required this.autovalidateMode,
    this.validator,
    super.key,
  });
  final GlobalKey<FormState> textFormFieldKey;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFormFieldKey,
      child: CommonPasswordInput(
        autovalidateMode: autovalidateMode,
        confirmPassword: true,
        checkPassword: true,
        validator: validator,
      ),
    );
  }
}
