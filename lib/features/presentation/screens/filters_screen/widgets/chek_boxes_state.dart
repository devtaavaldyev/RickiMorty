import 'package:flutter/cupertino.dart';

class ChekBoxesState with ChangeNotifier {
  final String? title;
  bool value;
  ChekBoxesState({
    this.title,
    this.value = false,
  });
  // void statusFunc({required String titles}){
  //   switch (title) {
  //     case 'alive':

  //       break;
  //     default:
  //   }
  // }

  @override
  void notifyListeners() {}
}

class FilterCharacters {
  final Filters filters;

  FilterCharacters({required this.filters});
}

enum Filters {
  alive(status: 'alive'),
  dead(status: 'dead'),
  unknown(status: 'unknown');

  const Filters({
    this.status,
  });
  final String? status;
  final bool? value = false;
}
