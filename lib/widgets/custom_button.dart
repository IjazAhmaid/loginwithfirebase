import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  const CustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
        )
      ],
    );
  }
}
