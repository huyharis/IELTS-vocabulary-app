import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/data/provider/appwrite_provider.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';
import 'package:ielts_vocabulary_app/pages/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(
        AuthRepository(
          AppwriteClientProvider(),
        ),
      ),
    );
  }
}
