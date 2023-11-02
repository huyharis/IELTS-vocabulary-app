import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ielts_vocabulary_app/constants/image_assets.dart';
import 'package:ielts_vocabulary_app/data/models/topic_model.dart';
import 'package:ielts_vocabulary_app/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Column(
          children: [
            _appBar(),
            Expanded(child: _body(context, controller, state)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }

  Widget _body(
      BuildContext context, HomeController controller, List<Topic>? list) {
    return Column(
      children: [
        _processBar(),
        _roadMap(context, controller, list),
      ],
    );
  }

  Widget _roadMap(
      BuildContext context, HomeController controller, List<Topic>? list) {
    return Container(
      width: double.infinity,
      height: 480,
      margin: const EdgeInsets.only(top: 38.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ..._buildList(list),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildList(List<Topic>? list) {
    List<Widget> tmp = [];
    bool isRight = true;
    for (var i = 0; i < list!.length; i++) {
      if (i % 2 == 0 && isRight) {
        isRight = false;
        tmp.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _itemToppic(list[i]),
              Expanded(child: _buildDash(height: 100)),
              _itemToppic(list[i]),
            ],
          ),
        );
        tmp.add(
          Row(
            children: [
              const Expanded(child: SizedBox()),
              RotatedBox(
                quarterTurns: 1,
                child: _buildDash(height: 100),
              ),
            ],
          ),
        );
      } else {
        isRight = true;
        tmp.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _itemToppic(list[i]),
              Expanded(child: _buildDash(height: 100)),
              _itemToppic(list[i]),
            ],
          ),
        );
        if (i != list.length) {
          tmp.add(
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: _buildDash(height: 100),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          );
        }
      }
    }
    return tmp.toList();
  }

  Widget _buildDash({double? width, double? height}) {
    return Container(
      width: width ?? 150,
      height: height,
      child: SvgPicture.asset(
        ImageAssets.DOT_IMAGE,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _itemToppic(Topic topic) {
    return SizedBox(
      height: 156,
      child: Column(
        children: [
          Container(
            width: 105,
            height: 105,
            margin: const EdgeInsets.only(bottom: 6.0),
            child: Image.network(topic.imgUrl),
          ),
          Container(
            width: 98,
            height: 31,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 5),
                    blurRadius: 3,
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Color(0xFFEAE1F1))),
            child: Center(
              child: Text(
                topic.title ?? '',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _processBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14.0),
      child: Column(
        children: [
          const Text(
            "Bạn đã học 0 trong số 12 chủ đề",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF5D1C97),
            ),
          ),
          Container(
            width: 265,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffe9e1f1),
            ),
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.only(top: 9.0),
            child: LinearProgressIndicator(
              value: 1.0,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF5D1C97),
      ),
      child: Container(
        padding: const EdgeInsets.only(
            top: 16.0, left: 12.0, right: 12.0, bottom: 24.0),
        margin: const EdgeInsets.only(bottom: 6.0),
        decoration: const BoxDecoration(
          color: Color(0xff8d3dd4),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 32.0),
              margin: const EdgeInsets.only(bottom: 27.0),
              child: _flagAndScore(),
            ),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Image.asset(ImageAssets.ICON_CATEGORY),
        ),
        const Flexible(
          child: Center(
            child: Text(
              'Chủ đề từ vựng band 0 - 3.5',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _flagAndScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.USA_FLAG),
        Row(
          children: [
            Row(
              children: [
                Image.asset(ImageAssets.FIRE_ICON),
                const Text(
                  '234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 13.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Image.asset(ImageAssets.ENERGY_ICON),
                  ),
                  const Text(
                    '234',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
