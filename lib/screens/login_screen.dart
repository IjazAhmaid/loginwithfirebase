import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginwithfirebase/screens/login_email_password_screen.dart';
import 'package:loginwithfirebase/screens/phone_screen.dart';
import 'package:loginwithfirebase/screens/signup_email_password_screen.dart';
import 'package:loginwithfirebase/servicess/firbase_auth_meathod.dart';
import 'package:loginwithfirebase/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Email/Password Sign Up',
            onPressed: () {
              Navigator.pushNamed(context, SignupEmailPassword.routeName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Email/Password Login',
            onPressed: () {
              Navigator.pushNamed(context, EmailPasswordLogin.routeName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Phone Sign In',
            onPressed: () {
              Navigator.pushNamed(context, PhoneScreen.routeName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithGoogle(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Facebook Sign In',
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithFacebook(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Anonymous Sign In',
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                  .signInAnonymously(context);
            },
          )
        ],
      )),
    );
  }
}
