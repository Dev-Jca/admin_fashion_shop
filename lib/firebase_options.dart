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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAz7Ngc36U3fk7Pd_ieaVLQyUdMRCfQSq4',
    appId: '1:989884033884:web:c822c3663c67c9cd836f99',
    messagingSenderId: '989884033884',
    projectId: 'fashion-shop101',
    authDomain: 'fashion-shop101.firebaseapp.com',
    databaseURL: 'https://fashion-shop101-default-rtdb.firebaseio.com',
    storageBucket: 'fashion-shop101.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg1kDOvxEMcsn6LFZKTOOhLS2fcpld3T4',
    appId: '1:989884033884:android:c6f1ab4a326ca646836f99',
    messagingSenderId: '989884033884',
    projectId: 'fashion-shop101',
    databaseURL: 'https://fashion-shop101-default-rtdb.firebaseio.com',
    storageBucket: 'fashion-shop101.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFZEUL9kb60w6NmdTdouUxZ11SG9kVPZc',
    appId: '1:989884033884:ios:20cf400ece071ce9836f99',
    messagingSenderId: '989884033884',
    projectId: 'fashion-shop101',
    databaseURL: 'https://fashion-shop101-default-rtdb.firebaseio.com',
    storageBucket: 'fashion-shop101.appspot.com',
    androidClientId: '989884033884-aninlf1ridq1pep7rlved69b791b3n5t.apps.googleusercontent.com',
    iosClientId: '989884033884-3147kv5fp87lfi18akkbtno18kb06kus.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminFashionShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFZEUL9kb60w6NmdTdouUxZ11SG9kVPZc',
    appId: '1:989884033884:ios:20cf400ece071ce9836f99',
    messagingSenderId: '989884033884',
    projectId: 'fashion-shop101',
    databaseURL: 'https://fashion-shop101-default-rtdb.firebaseio.com',
    storageBucket: 'fashion-shop101.appspot.com',
    androidClientId: '989884033884-aninlf1ridq1pep7rlved69b791b3n5t.apps.googleusercontent.com',
    iosClientId: '989884033884-3147kv5fp87lfi18akkbtno18kb06kus.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminFashionShop',
  );
}
