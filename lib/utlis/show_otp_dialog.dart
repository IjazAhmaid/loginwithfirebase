import 'package:flutter/material.dart';

void showOTPDolog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPresswd,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: const Text('Send OTP'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                )
              ],
            ),
            actions: [
              TextButton(onPressed: onPresswd, child: const Text('Done'))
            ],
          ));
}
