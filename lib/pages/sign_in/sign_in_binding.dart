import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/data/provider/appwrite_provider.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';
import 'package:ielts_vocabulary_app/pages/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(
        AuthRepository(
          AppwriteClientProvider(),
        ),
      ),
    );
  }
}
