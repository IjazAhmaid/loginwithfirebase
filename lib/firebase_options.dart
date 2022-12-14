// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDweHi6-qCvhEzIO5VRd3QdDg4gISynsbY',
    appId: '1:492977837085:web:5383a38948f6735ab0a2f4',
    messagingSenderId: '492977837085',
    projectId: 'fir-flutter-auth-18a40',
    authDomain: 'fir-flutter-auth-18a40.firebaseapp.com',
    storageBucket: 'fir-flutter-auth-18a40.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYYp4rxRqoQuQcG0Ptzo1b8i7stn6RNQ4',
    appId: '1:492977837085:android:c64ea07881d22a6eb0a2f4',
    messagingSenderId: '492977837085',
    projectId: 'fir-flutter-auth-18a40',
    storageBucket: 'fir-flutter-auth-18a40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoDYHvGmeC1B0_qEmd8xOOUHDQKE7aOu8',
    appId: '1:492977837085:ios:8e22271423f2161fb0a2f4',
    messagingSenderId: '492977837085',
    projectId: 'fir-flutter-auth-18a40',
    storageBucket: 'fir-flutter-auth-18a40.appspot.com',
    androidClientId: '492977837085-kccapmf9q77eap54444lfkmvd1sarf92.apps.googleusercontent.com',
    iosClientId: '492977837085-59cgtpeic7ov9r78aqh4v6drjum9ut67.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginwithfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoDYHvGmeC1B0_qEmd8xOOUHDQKE7aOu8',
    appId: '1:492977837085:ios:8e22271423f2161fb0a2f4',
    messagingSenderId: '492977837085',
    projectId: 'fir-flutter-auth-18a40',
    storageBucket: 'fir-flutter-auth-18a40.appspot.com',
    androidClientId: '492977837085-kccapmf9q77eap54444lfkmvd1sarf92.apps.googleusercontent.com',
    iosClientId: '492977837085-59cgtpeic7ov9r78aqh4v6drjum9ut67.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginwithfirebase',
  );
}
