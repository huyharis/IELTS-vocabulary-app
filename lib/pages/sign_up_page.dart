import 'package:flutter/material.dart';
import 'package:ielts_vocabulary_app/constants/image_assets.dart';
import 'package:ielts_vocabulary_app/routes/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 42.0, top: 25.0),
              child: Text(
                'Register new account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7068D2),
                  fontSize: 36,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
            TextField(
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
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Color(0xFFA547F9)),
                decoration: InputDecoration(
                  hintText: 'Enter password...',
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Color(0xFFA547F9)),
                decoration: InputDecoration(
                  hintText: 'Confirm password...',
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
            ),
            Container(
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
                    'Register with email',
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
            ),
          ],
        ),
      ),
    );
  }
}
