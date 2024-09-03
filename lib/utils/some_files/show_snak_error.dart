import 'package:flutter/material.dart';
import 'package:try_ricki_2/main.dart';

class ShowSnackBar {
  static showError(
    String text,
  ) {
    scaffoldmessanger.currentState!.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
