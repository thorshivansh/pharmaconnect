import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool _isProgressVisible = false;

  /// Shows a progress dialog with a circular indicator.
  static void showProgressDialog({bool isCancellable = false}) {
    if (!_isProgressVisible) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      _isProgressVisible = true;
    }
  }

  /// Hides the progress dialog.
  static void hideProgressDialog() {
    if (_isProgressVisible) {
      Get.back();
    }
    _isProgressVisible = false;
  }
}
