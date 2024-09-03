import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';
import 'package:try_ricki_2/features/presentation/screens/filters_screen/widgets/chek_boxes_state.dart';
import 'package:try_ricki_2/core/resources/app_images.dart';


class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key, required this.bf}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
  String bf;
}

final allBoxes = ChekBoxesState();

bool isSelected = false;

class _FilterScreenState extends State<FilterScreen> {
  final statusChekBoxes = [
    ChekBoxesState(title: 'alive'),
    ChekBoxesState(title: 'dead'),
    ChekBoxesState(title: 'unknown'),
  ];
  final genderChekBoxes = [
    ChekBoxesState(title: 'male'),
    ChekBoxesState(title: 'female'),
    ChekBoxesState(title: 'neutral'),
  ];
  final filterCharacters = FilterCharacters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Фильтры',
          style: AppTextStyles.w500size20.copyWith(
            color: context.colors.textColor0B1E2D,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context, widget.bf);
            log('${widget.bf}');
          },
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              AppImages.notFilter,
              scale: 4,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Text(
              'Сортировать',
              style: AppTextStyles.w500size10.copyWith(
                color: context.colors.textColor828282,
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Language.of(context).alphabetically,
                  style: AppTextStyles.w400size16.copyWith(
                    color: context.colors.textColor0B1E2D,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImages.filterUp,
                      scale: 4,
                    ),
                    const SizedBox(width: 25),
                    Image.asset(
                      AppImages.filterDown,
                      scale: 4,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 24),
            Text(
              'Статус',
              style: AppTextStyles.w500size10.copyWith(
                color: context.colors.textColor828282,
              ),
            ),
            ...statusChekBoxes.map(buildChekbox).toList(),
            const Divider(thickness: 2),
            ...genderChekBoxes.map(buildChekbox).toList(),
          ],
        ),
      ),
    );
  }

  CheckboxListTile buildChekbox(ChekBoxesState? stateBoxes) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white,
      activeColor: Colors.blue,
      value: stateBoxes?.value,
      onChanged: (value) {
        log('ITS ${stateBoxes?.title}');

        setState(() {
          widget.bf = stateBoxes?.title ?? '';
          stateBoxes?.value = value!;
          log('ITS BF Set ${widget.bf}');
        });
      },
      title: Text(stateBoxes?.title ?? ''),
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  // void notFilter({bool? notValue}) {
  //   // TODO null Error beret
  //   if (notValue == null) return;
  //   setState(() {
  //     allBoxes.value = notValue;
  //     statusChekBoxes.forEach((element) {
  //       element.value = notValue;
  //     });
  //     genderChekBoxes.forEach((element) {
  //       element.value = notValue;
  //     });
  //   });
  // }
}
