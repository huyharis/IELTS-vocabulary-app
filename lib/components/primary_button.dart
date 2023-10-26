import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final Function onPress;
  final Color? backGroundColor;
  final Color? shadowColor;
  final String textBtn;
  final TextStyle textBtnStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0.09,
  );
  const PrimaryButton(
      {required this.onPress,
      required this.textBtn,
      this.backGroundColor,
      this.shadowColor,
      super.key});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 353,
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: const BoxDecoration(
          color: Color(0xFF251C97),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(353, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: const Color(0xFF6562DB),
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
          ),
        ),
      ),
    );
  }
}
