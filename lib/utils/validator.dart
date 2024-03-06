


import 'package:form_field_validator/form_field_validator.dart';

import '../features/payment/utils/card_utilis.dart';

TextFieldValidator requiredValidator(
        {String? errorMessage, bool trim = true}) =>
    RequiredValidator(
      errorText: errorMessage ?? 'This field required',
      trim: trim,
    );

MultiValidator emailValidator({String? errorMessage, bool trim = false}) =>
    MultiValidator([
      requiredValidator(
          errorMessage: errorMessage ?? 'This field required', trim: trim),
      EmailValidator(
          errorText: errorMessage ?? 'الرجاء ادخال ايميل صحيح', trim: trim),
    ]);

MultiOptionalValidator userNameOrEmailValidator({bool trim = false}) =>
    MultiOptionalValidator(
      [
        userNameValidator(errorMessage: '', trim: trim),
        emailValidator(errorMessage: '', trim: trim),
      ],
      "",
    );

MultiValidator cardNumberValidator() => MultiValidator([
      requiredValidator(errorMessage: 'This field required', trim: false),
      LengthRangeValidator(
          min: 8, max: 27, errorText: 'Too short!'),
  CardNumberValidator('Invalid Card!')
    ]);

MultiValidator cvvNumberValidator() => MultiValidator([
      requiredValidator(errorMessage: 'This field required', trim: false),
      LengthRangeValidator(
          min: 3, max: 4, errorText: 'Too short!'),
    ]);

MultiValidator userNameValidator({String? errorMessage, bool trim = false}) =>
    MultiValidator([
      requiredValidator(
          errorMessage: errorMessage ?? 'msg_error_username_validate',
          trim: trim),
      PatternValidator(
        r'^[A-Za-z](?=.*?[A-Za-z0-9_]).{3,32}$',
        errorText: errorMessage ?? '',
        trim: trim,
      ),
    ]);

MultiValidator fullNameValidator() => MultiValidator([
      requiredValidator(),
    ]);

TextFieldValidator passwordValidator() =>
    LengthRangeValidator(min: 8, max: 20, errorText: 'password is too short');

TextFieldValidator phoneValidator(int min, int max) => LengthRangeValidator(
    min: min, max: max, errorText: 'Enter valid phone number');

TextFieldValidator minValidator([int? min]) => MinLengthValidator(min ?? 2,
    errorText: 'ادخل ${min ?? 2} محارف على الأقل.');

class RequiredValidator extends TextFieldValidator {
  RequiredValidator({required String errorText, this.trim = false})
      : super(errorText);
  final bool trim;

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return (trim ? value?.trim() : value)?.isNotEmpty ?? true;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}

class CardNumberValidator extends TextFieldValidator {
  CardNumberValidator(errorText) : super(errorText);

  @override
  bool isValid(String? value) {
    value = CardUtils.getCleanedNumber(value!);
    int sum = 0;
    int length = value.length;
    for (var i = 0; i < length; i++) {
      int digit = int.parse(value[length - i - 1]);

      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return true;
    }
    return false;
  }
}

class PatternValidator extends TextFieldValidator {
  PatternValidator(
    this.pattern, {
    required String errorText,
    this.caseSensitive = true,
    this.trim = false,
  }) : super(errorText);

  final Pattern pattern;
  final bool caseSensitive;
  final bool trim;

  @override
  bool isValid(String? value) => hasMatch(
        pattern.toString(),
        trim ? value!.trim() : value!,
        caseSensitive: caseSensitive,
      );
}

class EmailValidator extends TextFieldValidator {
  EmailValidator({required String errorText, this.trim = false})
      : super(errorText);

  final bool trim;

  /// regex pattern to validate email inputs.
  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  @override
  bool isValid(String? value) =>
      hasMatch(_emailPattern.toString(), value!, caseSensitive: false);
}

class MultiOptionalValidator extends FieldValidator<String?> {
  MultiOptionalValidator(this.validators, String errorText) : super(errorText);

  final List<FieldValidator> validators;

  @override
  bool isValid(value) {
    for (final FieldValidator validator in validators) {
      if (validator.call(value) == null) {
        return true;
      }
    }
    return false;
  }

  @override
  String? call(dynamic value) {
    return isValid(value) ? null : errorText;
  }
}
