import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:pinput/pinput.dart';

import '../../../../Helper/app_color.dart';


class VerificationNumberFields extends StatefulWidget {
  const VerificationNumberFields({
    Key? key,
    required this.onCompleted,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<VerificationNumberFields> createState() => _VerificationNumberFieldsState();
}

class _VerificationNumberFieldsState extends State<VerificationNumberFields> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: MyFontStyle.boldStyle(14, AppColors.primaryColor[50]!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(),
    );

    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: widget.validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      pinAnimationType: PinAnimationType.slide,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      length: 4,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
      ],
    );
  }
}
