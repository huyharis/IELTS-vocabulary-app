import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent, // Transparent background
      elevation: 0,
      child: Center(
        child: CircularProgressIndicator(), // Loading indicator
      ),
    );
  }
}
