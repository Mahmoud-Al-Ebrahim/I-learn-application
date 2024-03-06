import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:graduation_project/features/payment/utils/add_cards_notifier.dart';
import 'package:graduation_project/features/payment/utils/card_type.dart';
import 'package:graduation_project/features/payment/utils/card_utilis.dart';
import 'package:graduation_project/global_widget/custom_button.dart';

import '../../Helper/app_color.dart';
import '../../global_widget/app_chips.dart';
import '../../global_widget/app_text_field.dart';
import '../../utils/validator.dart';
import 'card_number_input_formatter.dart';
import 'expire_date_input_formatter.dart';

class AddCardContent extends StatefulWidget {
  const AddCardContent({Key? key}) : super(key: key);

  @override
  State<AddCardContent> createState() => _AddCardContentState();
}

class _AddCardContentState extends State<AddCardContent> {
  late final ValueNotifier<CardType> cardType;
  late final ValueNotifier<bool> saveValue;
  late final AddCardNotifier addCardNotifier;
  late final ValueNotifier<int> selectedChip;
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void getCardTypeFromNumber() {
    if (controllers[0].text.length < 7) {
      String cardNumber = CardUtils.getCleanedNumber(controllers[0].text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNumber);
      if (type != cardType.value) {
        cardType.value = type;
      }
    }
  }

  @override
  void didChangeDependencies() {
    controllers[0].addListener(() {
      getCardTypeFromNumber();
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    cardType = ValueNotifier(CardType.Invalid);
    saveValue = ValueNotifier(false);
    selectedChip = ValueNotifier(0);
    addCardNotifier = AddCardNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: selectedChip,
        builder: (context, newSelectedChip, _) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 300),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 22, top: 30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.accentColor[50]!,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text('Add Card',
                              style: MyFontStyle.boldStyle(
                                  20, AppColors.accentColor[50]!)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      AppChips(
                        text: 'by Card',
                        textStyle: MyFontStyle.bookStyle(
                            17, AppColors.accentColor[50]!),
                        iconUrl: 'assets/card/card.svg',
                        isSelected: newSelectedChip == 0,
                        onChangeChips: (val) {
                          selectedChip.value = 0;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AppChips(
                          text: 'sayriatel cash',
                          textStyle: MyFontStyle.bookStyle(
                              17, AppColors.accentColor[50]!),
                          iconUrl: 'assets/wallet.svg',
                          isSelected: newSelectedChip == 1,
                          onChangeChips: (val) {
                            selectedChip.value = 1;
                          }),
                    ],
                  ),
                  newSelectedChip == 0
                      ? Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                              key: key,
                              child: Column(
                                children: [
                                  ValueListenableBuilder<CardType>(
                                      valueListenable: cardType,
                                      builder: (context, cardType, _) {
                                        return AppTextField(
                                          hintText: 'Card Number',
                                          controller: controllers[0],
                                          textDirection: TextDirection.ltr,
                                          textInputType: TextInputType.number,
                                          onChange: (cardNumber) =>
                                              addCardNotifier.enterCardNumber =
                                                  cardNumber.isNotEmpty,
                                          validator: cardNumberValidator(),
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                19),
                                            CardNumberInputFormatter(),
                                          ],
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child:
                                                CardUtils.getCardIcon(cardType),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: SvgPicture.asset(
                                                'assets/card/card.svg',
                                                color: AppColors
                                                    .primaryColor[50]!),
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: AppTextField(
                                        hintText: 'MM/YY',
                                        textInputType: TextInputType.number,
                                        onChange: (expireDate) =>
                                            addCardNotifier.enterExpireDate =
                                                expireDate.isNotEmpty,
                                        controller: controllers[1],
                                        maxLines: 1,
                                        validator: requiredValidator(),
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(4),
                                          CardExpireDateInputFormatter()
                                        ],
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SvgPicture.asset(
                                              'assets/card/calender.svg',
                                              color:
                                                  AppColors.primaryColor[50]!),
                                        ),
                                      )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: AppTextField(
                                        textInputType: TextInputType.number,
                                        controller: controllers[2],
                                        hintText: 'cvc/cvv',
                                        onChange: (cvv) => addCardNotifier
                                            .enterCvv = cvv.isNotEmpty,
                                        validator: cvvNumberValidator(),
                                        maxLines: 1,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(4),
                                        ],
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SvgPicture.asset(
                                              'assets/card/Cvv.svg',
                                              color:
                                                  AppColors.primaryColor[50]!),
                                        ),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppTextField(
                                    textInputType: TextInputType.text,
                                    hintText: 'Card Holder',
                                    validator: requiredValidator(),
                                    controller: controllers[3],
                                    onChange: (cardHolder) =>
                                        addCardNotifier.enterCardHolder =
                                            cardHolder.isNotEmpty,
                                    maxLines: 1,
                                    inputFormatters: [
                                      FilteringTextInputFormatter(
                                          RegExp(r'[a-z A-Z]'),
                                          allow: true)
                                    ],
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: SvgPicture.asset(
                                        'assets/card/person.svg',
                                        color: AppColors.primaryColor[50]!,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )
                      : Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Please pay for the Course using ',
                                    style: MyFontStyle.boldStyle(
                                        18, AppColors.accentColor[50]!).copyWith(
                                      height: 1.5
                                    )
                                  ),
                                  TextSpan(
                                      text: 'Syriatel Cash Service ',
                                      style: MyFontStyle.boldStyle(
                                          18, Colors.deepOrange).copyWith(
                                          height: 1.5
                                      )
                                  ),
                                  TextSpan(
                                      text: 'and put the payment process code in the input field below',
                                      style: MyFontStyle.boldStyle(
                                          18, AppColors.accentColor[50]!).copyWith(
                                          height: 1.5
                                      )
                                  ),
                                ]
                              )),
                              const SizedBox(height:10),
                              AppTextField(
                                textInputType: TextInputType.number,
                                hintText: 'Payment precess code',
                                validator: requiredValidator(),
                                onChange: (code) => addCardNotifier
                                    .enterPaymentCode = code.isNotEmpty,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    'assets/wallet.svg',
                                    color: AppColors.primaryColor[50]!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: AnimatedBuilder(
                          animation: addCardNotifier,
                          builder: (context, child) {
                            return CustomButton(
                              borderColor: Color(0xffF2F3F3),
                              buttonColor: AppColors.primaryColor[50]!,
                              onPressed: ((addCardNotifier.fillAllInfo &&
                                          newSelectedChip == 0) ||
                                      (addCardNotifier.code &&
                                          newSelectedChip == 1))
                                  ? _submit
                                  : null,
                              content: Text('Continue',
                                  style: MyFontStyle.boldStyle(
                                      20, AppColors.scaffoldBackGroundColor)),
                              width: double.infinity,
                            );
                          })),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        });
  }

  void _submit() {
    key.currentState!.save();
    final validate = key.currentState!.validate();
    if (!validate) return;
  }

  convertStringToTime(String myDate) {
    String a =
        '${'20${myDate[3]}${myDate[4]}'}-${(myDate[0] + myDate[1])}-16T14:11:10.453Z';
    return a;
  }
}
