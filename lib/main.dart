import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:loginwithfirebase/firebase_options.dart';
import 'package:loginwithfirebase/screens/login_email_password_screen.dart';
import 'package:loginwithfirebase/screens/login_screen.dart';
import 'package:loginwithfirebase/screens/phone_screen.dart';
import 'package:loginwithfirebase/screens/signup_email_password_screen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding();
  if (kIsWeb) {
    await FacebookAuth.i.webInitialize(
        appId: "590823809283797", cookie: true, xfbml: true, version: "v13.0");
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        SignupEmailPassword.routeName: (context) => const SignupEmailPassword(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
