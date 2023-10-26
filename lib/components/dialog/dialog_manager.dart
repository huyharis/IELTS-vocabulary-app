import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/components/dialog/loading_dialog.dart';

enum DialogType { loading, error, custom }

class DialogManager extends GetxController {
  static final DialogManager instance = DialogManager._();
  final _currentDialog = Rx<DialogType>(DialogType.loading);

  DialogManager._();

  final _isDialogShowing = false.obs;

  bool get isDialogShowing => _isDialogShowing.value;

  DialogType get currentDialog => _currentDialog.value;

  void showLoading() {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
  }

  void showError() {
    _currentDialog.value = DialogType.error;
  }

  void showCustomDialog() {
    _currentDialog.value = DialogType.custom;
  }

  void hideDialog() {
    Get.back();
    _isDialogShowing.value = false;
  }
}
