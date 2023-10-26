import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/data/provider/appwrite_provider.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';
import 'package:ielts_vocabulary_app/pages/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(
        AuthRepository(
          AppwriteClientProvider(),
        ),
      ),
    );
  }
}