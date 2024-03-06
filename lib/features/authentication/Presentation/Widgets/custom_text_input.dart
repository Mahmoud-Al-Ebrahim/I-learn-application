import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/focus_node_cubit/focus_node_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/focus_node_cubit/focus_node_state.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/password_visible/password_visible_cubit.dart';
import 'package:graduation_project/features/authentication/Presentation/Blocs/password_visible/password_visible_state.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({Key? key,
    required this.iconUrl,
    required this.focusNode,
    required this.controller,
    required this.labelText})
      : super(key: key);

  final String iconUrl;
  final String labelText;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<FocusNodeCubit, FocusNodeChanged>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
          child: SizedBox(
            height: size.height * 0.08,
            child: TextFormField(
              onTap: () {
                context.read<FocusNodeCubit>().focusNodeUpdated();
              },
              focusNode: widget.focusNode,
              controller: widget.controller,
              obscureText: ((widget.labelText == 'Password' && context
                  .read<PasswordVisibleCubit>()
                  .passwordVisible) ||
                  (widget.labelText == 'Confirm Password' && context
                      .read<PasswordVisibleCubit>()
                      .confirmPasswordVisible))?true:false,
                      decoration: InputDecoration(
                      suffixIcon: ((widget.labelText == 'Password') ||
                  (widget.labelText == 'Confirm Password'))
                  ? BlocBuilder<PasswordVisibleCubit, PasswordVisibleChanged>(
                builder: (context, state) {
                  if (state is PasswordVisibleChanged) {
                    return IconButton(
                        icon: Icon(
                          ((state.passwordVisible &&
                              widget.labelText ==
                                  'Password') ||
                              (state.confirmPasswordVisible &&
                                  widget.labelText ==
                                      'Confirm Password'))
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: !widget.focusNode.hasFocus
                              ? AppColors.accentColor[300]!
                              .withOpacity(0.5)
                              : AppColors.primaryColor[25]!,
                          size: 20,
                        ),
                        onPressed: () {
                          context
                              .read<PasswordVisibleCubit>()
                              .changeVisibility(
                              (widget.labelText == 'Password')
                                  ? !state.passwordVisible
                                  : state.passwordVisible,
                              (widget.labelText ==
                                  'Confirm Password')
                                  ? !state.confirmPasswordVisible
                                  : state.confirmPasswordVisible);
                          context.read<FocusNodeCubit>().focusNodeUpdated();

                        }
                        );
                  } else {
                    return Container();
                  }
                },
              )
                  : null,
              labelText: widget.labelText,
              icon: Padding(
                padding: EdgeInsets.only(top: size.height * 0.025),
                child: SvgPicture.asset(
                  widget.iconUrl,
                  width: 15,
                  height: 15,
                  color: widget.focusNode.hasFocus
                      ? AppColors.primaryColor[25]!
                      : AppColors.accentColor[300]!,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor[25]!),
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.focusNode.hasFocus
                    ? AppColors.primaryColor[25]!
                    : AppColors.primaryColor[400]!.withOpacity(0.3),
              ),
            ),
          ),
        ),);
      },
    );
  }
}
