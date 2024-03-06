import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/Helper/app_color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.onTap,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled,
    this.textInputType,
    this.textInputAction,
    this.textDirection,
    this.validator,
    this.maxLengthEnforcement,
    this.focusNode,
    this.autoValidateMode,
    this.scrollPhysics,
    this.scrollController,
    this.initialValue,
    this.keyboardAppearance,
    this.textAlignVertical,
    this.toolbarOptions,
    this.obscuringCharacter = "•",
    this.expands = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.showLength = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.titleField,
    this.obscure = false,
    this.prefixIcon,
    this.icon,
    this.hintTextStyle,
    this.textStyle,
    this.suffixIcon,
    this.suffix,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String val)? onChange;
  final void Function(String val)? onFieldSubmitted;
  final void Function(String? val)? onSaved;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? enabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final FormFieldValidator<String?>? validator;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidateMode;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final TextAlignVertical? textAlignVertical;
  final ToolbarOptions? toolbarOptions;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsets scrollPadding;
  final bool expands;
  final bool readOnly;
  final bool autocorrect;
  final String obscuringCharacter;
  final String? titleField;
  final bool showLength;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: showLength ? maxLength : null,
      textAlign: textAlign,
      enabled: enabled,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      textDirection: textDirection,
      scrollPadding: scrollPadding,
      expands: expands,
      maxLengthEnforcement: maxLengthEnforcement,
      focusNode: focusNode,
      obscureText: obscure,
      obscuringCharacter: obscuringCharacter,
      autovalidateMode: autoValidateMode,
      readOnly: readOnly,
      scrollPhysics: scrollPhysics,
      scrollController: scrollController,
      autocorrect: false,
      cursorColor: AppColors.primaryColor[50]!,
      initialValue: initialValue,
      keyboardAppearance: keyboardAppearance,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      toolbarOptions: toolbarOptions,
      inputFormatters: [
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        if (textInputType == TextInputType.phone ||
            textInputType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ...?inputFormatters
      ],
      style:const TextStyle(
        fontSize: 18,

        /// 18
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
        fontFamily: 'nexa_bold',
        decoration: TextDecoration.none,
        decorationColor: Color(0xffF2F3F3),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF2F3F3)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF2F3F3)),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Color(0xffF2F3F3)),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Color(0xffF2F3F3)),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor:const  Color(0xffF2F3F3),
        contentPadding:
            contentPadding ?? const EdgeInsetsDirectional.only(start: 20, end: 10),
        prefixIcon: prefixIcon,
        icon: icon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        hintText: hintText,
        hintStyle:const TextStyle(
          fontSize: 16,

          /// 18
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
          fontFamily: 'nexa_bold',
          decoration: TextDecoration.none,
          decorationColor: Color(0xffF2F3F3),
        ),
        labelText: labelText,
      ),
    );
  }
}
