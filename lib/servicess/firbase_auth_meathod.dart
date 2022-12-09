import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:loginwithfirebase/utlis/show_otp_dialog.dart';
import 'package:loginwithfirebase/utlis/show_snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//import com.facebook.FacebookSdk;
//import com.facebook.appevents.AppEventsLogger;
bool mounted = false;

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signUpwithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!mounted) return;
      await sendEmailVarification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_auth.currentUser!.emailVerified) {
        if (!mounted) return;
        await sendEmailVarification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // EMAIL VARIFICTION
  Future<void> sendEmailVarification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verifiction sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // GOOGLE SIGN IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider? googleProvider = GoogleAuthProvider();
        googleProvider.addScope(
            'https://www.googleapis.com/auth/cloud-platform.read-only');
        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          // if(userCredential.user ! = null){
          // if(userCredential.additionalUserInfo!.isNewUser){}
          // }
        }
      }
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // FACEBOOK VARIFICATION
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // ANYNMOUS SIGNIN
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // PHONE VARIFICATION
  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    TextEditingController codeController = TextEditingController();
// FOR WEB ONLY
    if (kIsWeb) {
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);
      showOTPDolog(
          codeController: codeController,
          context: context,
          onPresswd: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: result.verificationId,
              smsCode: codeController.text.trim(),
            );

            await _auth.signInWithCredential(credential);

            if (!mounted) return;
            Navigator.of(context).pop();
          });
    } else {
      await _auth.verifyPhoneNumber(
          // WORK FOR IOS AND ANDROID
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            showSnackBar(context, e.message!);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            showOTPDolog(
                codeController: codeController,
                context: context,
                onPresswd: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim(),
                  );
                  await _auth.signInWithCredential(credential);
                  if (!mounted) return;
                  Navigator.of(context).pop();
                });
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    }
  }
}

// keytool -exportcert -alias androiddebugkey -keystore "C:\Users\ejazm\.android\debug.keystore" | "C:\OpenSSL" sha1 -binary | "C:\OpenSSL" base64
      

