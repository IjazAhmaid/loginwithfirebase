import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginwithfirebase/servicess/firbase_auth_meathod.dart';
import 'package:loginwithfirebase/widgets/custom_button.dart';
import 'package:loginwithfirebase/widgets/custom_text_filed.dart';

class EmailPasswordLogin extends StatefulWidget {
  static String routeName = '/Login_email_password';
  const EmailPasswordLogin({Key? key}) : super(key: key);

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 30),
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
            labelText: 'Password',
            hintText: 'Enter your Password',
            obscureText: true,
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
            onPressed: loginUser,
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
