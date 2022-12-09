import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginwithfirebase/servicess/firbase_auth_meathod.dart';
import 'package:loginwithfirebase/widgets/custom_button.dart';
import 'package:loginwithfirebase/widgets/custom_text_filed.dart';

class SignupEmailPassword extends StatefulWidget {
  static String routeName = '/Signup_email_password';

  const SignupEmailPassword({Key? key}) : super(key: key);

  @override
  State<SignupEmailPassword> createState() => _SignupEmailPasswordState();
}

class _SignupEmailPasswordState extends State<SignupEmailPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void siginUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpwithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          CustomTextFiled(
            conroler: emailController,
            labelText: 'Email',
            hintText: 'Enter Your Email',
            obscureText: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          CustomTextFiled(
            conroler: passwordController,
            obscureText: true,
            labelText: 'Password',
            hintText: 'Enter your Password',
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onPressed: siginUpUser,
            text: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
