import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/components/dialog/dialog_manager.dart';
import 'package:ielts_vocabulary_app/components/dialog/loading_dialog.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';
import 'package:ielts_vocabulary_app/routes/app_pages.dart';

class SignUpController extends GetxController {
  AuthRepository authRepository;

  SignUpController(this.authRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isFormValid = false;

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

  String? validateConfirmPassword(String? value) {
    if (value?.isEmpty == true || value != confirmPasswordController.text) {
      return "Password doesn't match";
    }
    return null;
  }

  void clearTextEditingController(){
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  validateFormAndSignUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      try {
        DialogManager.instance.showLoading();
        await authRepository.signUp({
          "userId": ID.unique(),
          "email": email,
          "password": password,
        }).then((value) {
          DialogManager.instance.hideDialog();
          Get.snackbar('Success', "User account created",
              backgroundColor: Colors.greenAccent);
          Get.offAllNamed(Routes.signIn);
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
}
