// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';


import 'package:try_ricki_2/core/resources/app_images.dart';
import 'package:try_ricki_2/features/presentation/bloc/characters/characters_bloc.dart';

import 'package:try_ricki_2/service_locator.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';



// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.onPressed,
    required this.onTap,
  }) : super(key: key);

  final String hintText;

  final Function(String name) onChanged;
  final Function() onPressed;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    String stat = '';
    String names = '';
    return TextField(
      keyboardType: TextInputType.text,
      toolbarOptions: const ToolbarOptions(selectAll: true),
      onChanged: (name) {
        names = name;
      },
      onSubmitted: (value) {},
      textInputAction: TextInputAction.search,
      cursorHeight: 22,
      cursorColor: context.colors.unSelectedBDBDBD,
      style: AppTextStyles.w400size16,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        fillColor: context.colors.colorF2F2F2,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.w400size16
            .copyWith(color: context.colors.unSelectedBDBDBD),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 6,
          ),
          child: BlocProvider.value(
            value: sl<CharactersBloc>(),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
                color: context.colors.unSelectedBDBDBD,
              ),
              onPressed: onPressed
              //  () {
              //   log('Stata Ne ${stat}');
              //   sl<CharactersBloc>()
              //       .add(CharacterEvents.searchCharacters(names, stat, ''));
              // }
              ,
            ),
          ),
        ),
        suffixIcon: SizedBox(
          width: 1,
          child: IntrinsicHeight(
            child: InkWell(
              onTap: onTap
              // () async {
              //   log('Stata Ne Gelmish ${stat}');
              //   stat = await Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => FilterScreen(
              //         bf: stat,
              //       ),
              //     ),
              //   );
              // }
              ,
              child: Row(
                children: [
                  const VerticalDivider(
                    thickness: 2,
                    width: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AppImages.filterTextField,
                    scale: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
