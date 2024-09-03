// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of'../editing_screen.dart';

import 'package:flutter/material.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';


class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: context.colors.colorF2F2F2,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.w400size16.copyWith(
          color: context.colors.dark0B1E2D,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
