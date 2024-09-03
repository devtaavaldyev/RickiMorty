// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of '../character_screen.dart';

// // ignore: must_be_immutable
// class _SearchAppBar extends StatelessWidget {
//   _SearchAppBar({
//     Key? key,
//     // required this.onPressed,
//     required this.isGridView,
//   }) : super(key: key);

//   bool isGridView;
//   // final Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const AppTextField(hintText: 'Найти Персонажа'),
//         const SizedBox(height: 12),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               'Всего персонажей: 200'.toUpperCase(),
//               style: AppTextStyles.w500size10.copyWith(
//                 color: AppColors.textColor828282,
//               ),
//             ),
//             const SizedBox(width: 165),
//             IconButton(
//               onPressed: () {
//                 isGridView != isGridView;
//               },
//               icon: isGridView
//                   ? const Icon(Icons.grid_view_outlined)
//                   : const Icon(Icons.format_list_bulleted),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
