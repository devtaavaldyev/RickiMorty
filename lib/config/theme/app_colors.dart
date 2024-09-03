// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_theme.dart';

abstract class AppColors {
  AppColors({
    required this.lightFCFCFC,
    required this.dark0B1E2D,
    required this.colorF2F2F2,
    required this.colorFFFFFF,
    required this.unSelectedBDBDBD,
    required this.textColor828282,
    required this.textColor0B1E2D,
    required this.textColor43D049,
    required this.textColorEB5757,
    required this.navBarSelect,
    required this.buttonColors,
  });
  final Color lightFCFCFC;
  final Color dark0B1E2D;
  final Color colorF2F2F2;
  final Color colorFFFFFF;
  final Color unSelectedBDBDBD;
  final Color textColor828282;
  final Color textColor0B1E2D;
  final Color textColor43D049;
  final Color textColorEB5757;
  final Color navBarSelect;
  final Color buttonColors;
}

class DarkColors implements AppColors {
  @override
  Color get colorF2F2F2 => const Color(0xff152A3A);

  @override
  Color get colorFFFFFF => const Color(0xff152A3A);

  @override
  Color get dark0B1E2D => const Color(0xffFFFFFF);

  @override
  Color get lightFCFCFC => const Color(0xff0B1E2D);

  @override
  Color get navBarSelect => const Color(0xff43D049);

  @override
  Color get textColor0B1E2D => const Color(0xffFFFFFF);

  @override
  Color get textColor43D049 => const Color(0xff43D049);
  @override
  Color get buttonColors => const Color(0xff22A2BD);

  @override
  Color get textColor828282 => const Color.fromARGB(125, 121, 140, 153);

  @override
  Color get textColorEB5757 => const Color(0xffEB5757);

  @override
  Color get unSelectedBDBDBD => const Color(0xff5B6975);
}

class LightColors implements AppColors {
  @override
  Color get colorF2F2F2 => const Color(0xffF2F2F2);

  @override
  Color get colorFFFFFF => const Color(0xffFFFFFF);

  @override
  Color get dark0B1E2D => const Color(0xff0B1E2D);

  @override
  Color get lightFCFCFC => const Color(0xffFCFCFC);

  @override
  Color get navBarSelect => const Color(0xff22A2BD);

  @override
  Color get buttonColors => const Color(0xff22A2BD);

  @override
  Color get textColor0B1E2D => const Color(0xff0B1E2D);

  @override
  Color get textColor43D049 => const Color(0xff43D049);

  @override
  Color get textColor828282 => const Color(0xff828282);

  @override
  Color get textColorEB5757 => const Color(0xffEB5757);

  @override
  Color get unSelectedBDBDBD => const Color(0xffBDBDBD);
}


  //   static Color lightFCFCFC = const Color(0xffFCFCFC);
  // static Color dark0B1E2D = const Color(0xff0B1E2D);

  // static Color colorF2F2F2 = const Color(0xffF2F2F2);
  // static Color colorFFFFFF = const Color(0xffFFFFFF);
  // static Color unSelectedBDBDBD = const Color(0xffBDBDBD);
  // static Color textColor828282 = const Color(0xff828282);
  // static Color textColor0B1E2D = const Color(0xff0B1E2D);
  // static Color textColor43D049 = const Color(0xff43D049);
  // static Color textColorEB5757 = const Color(0xffEB5757);
  // static Color navBarSelect = const Color(0xff22A2BD);