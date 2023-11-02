import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielts_vocabulary_app/components/dialog/dialog_manager.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';
import 'package:ielts_vocabulary_app/routes/app_pages.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isFormValid = false;
  AuthRepository authRepository;

  final GetStorage _getStorage = GetStorage();

  SignInController(this.authRepository);

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Please enter email';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (!emailValid) {
      return 'Incorrect email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return 'Please enter password';
    }
    return null;
  }

  void clearTextEditingController() {
    emailController.clear();
    passwordController.clear();
  }

  login({required String email, required String password}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      try {
        DialogManager.instance.showLoading();
        await authRepository.signIn({
          "email": email,
          "password": password,
        }).then((value) {
          DialogManager.instance.hideDialog();
          Get.snackbar('Success', "Logging in",
              backgroundColor: Colors.greenAccent);
          Get.offAllNamed(Routes.home);
          _getStorage.write("userId", value.userId);
          _getStorage.write("sectionId", value.$id);
          clearTextEditingController();
        }).catchError((error) {
          DialogManager.instance.hideDialog();
          if (error is AppwriteException) {
            Get.snackbar('Error', error.response["message"].toString(),
                backgroundColor: Colors.redAccent);
          } else {
            Get.snackbar('Error', error.toString(),
                backgroundColor: Colors.redAccent);
          }
        });
      } catch (e) {
        DialogManager.instance.hideDialog();
        Get.snackbar('Error', e.toString(), backgroundColor: Colors.redAccent);
      }
    }
  }

  loginWithGoogle() async {
    try {
      // DialogManager.instance.showLoading();
      await authRepository.loginWithGoogle().then((value) {
        print('valueeee $value');
        if (value != null) {
          DialogManager.instance.hideDialog();
          Get.snackbar('Success', "Logging in",
              backgroundColor: Colors.greenAccent);
          Get.offAllNamed(Routes.home);
        }
      }).catchError((error) {
        DialogManager.instance.hideDialog();
        if (error is AppwriteException) {
          Get.snackbar('Error', error.response["message"].toString(),
              backgroundColor: Colors.redAccent);
        } else {
          Get.snackbar('Error', error.toString(),
              backgroundColor: Colors.redAccent);
        }
      });
    } catch (e) {
      DialogManager.instance.hideDialog();
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.redAccent);
    }
  }
}
