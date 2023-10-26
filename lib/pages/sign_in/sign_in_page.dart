import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/constants/image_assets.dart';
import 'package:ielts_vocabulary_app/pages/sign_in/sign_in_controller.dart';
import 'package:ielts_vocabulary_app/routes/app_pages.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.find<SignInController>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(ImageAssets.LOGO),
                  const Flexible(
                    child: Text(
                      'IELTS VOCABULARY APP',
                      style: TextStyle(
                        color: Color(0xFFA547F9),
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 38.0, right: 38.0, top: 47.0, bottom: 23.0),
                child: Form(
                  key: signInController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: signInController.emailController,
                        validator: (value) =>
                            signInController.validateEmail(value),
                        style: const TextStyle(color: Color(0xFFA547F9)),
                        decoration: InputDecoration(
                          hintText: 'Enter email...',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.27000001072883606),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: TextFormField(
                          controller: signInController.passwordController,
                          validator: (value) =>
                              signInController.validatePassword(value),
                          obscureText: true,
                          style: const TextStyle(color: Color(0xFFA547F9)),
                          decoration: InputDecoration(
                            hintText: 'Enter password...',
                            hintStyle: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.27000001072883606),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFD9D9D9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 353,
                        padding: const EdgeInsets.only(bottom: 8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFF5D1C97),
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: ElevatedButton(
                          onPressed: () {
                            signInController.login(
                                email: signInController.emailController.text,
                                password:
                                    signInController.passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(353, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color(0xFFA547F9),
                          ),
                          child: const Center(
                              child: Text(
                            'Login with email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                            ),
                          )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 17),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 353,
                        padding: const EdgeInsets.only(bottom: 8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFF971C1C),
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: ElevatedButton(
                          onPressed: () {
                            signInController.loginWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(353, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color(0xFFE96D6D),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(ImageAssets.GOOGLE_LOGO),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Login with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0.09,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'if you don’t have account, ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.SIGN_UP);
                      Get.toNamed(Routes.signUp);
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF6562DB),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
