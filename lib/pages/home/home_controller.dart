import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/components/dialog/dialog_manager.dart';
import 'package:ielts_vocabulary_app/data/models/topic_model.dart';
import 'package:ielts_vocabulary_app/data/repository/auth_repository.dart';

class HomeController extends GetxController with StateMixin<List<Topic>> {
  AuthRepository authRepository;

  HomeController(this.authRepository);

  late List<Topic> listTopic = [];

  @override
  void onInit() {
    // getTopicList();
    super.onInit();
  }

  @override
  void onReady() {
    getTopicList();
    super.onReady();
  }

  getTopicList() async {
    try {
      change(null, status: RxStatus.loading());
      await authRepository.getTopics().then((value) {
        Map<String, dynamic> data = value.toMap();
        List list = data['documents'].toList();
        listTopic = list
            .map(
              (e) => Topic.fromMap(e['data']),
            )
            .toList();
      });
      change(listTopic, status: RxStatus.success());
    } catch (e) {
      DialogManager.instance.hideDialog();
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.redAccent);
    }
  }
}
