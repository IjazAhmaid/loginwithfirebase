import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginwithfirebase/servicess/firbase_auth_meathod.dart';
import 'package:loginwithfirebase/widgets/custom_button.dart';
import 'package:loginwithfirebase/widgets/custom_text_filed.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone-screen';

  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFiled(
            conroler: phoneController,
            hintText: 'Enter Phone Number',
            labelText: 'Phone Number',
            obscureText: false,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            onPressed: phoneSignIn,
            text: 'SEND OTP',
          )
        ],
      ),
    );
  }
}
