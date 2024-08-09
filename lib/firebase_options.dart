// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: "AIzaSyAejgrYBNqHl1q7nO8RmMsPOHkvG3V1zwA",
    authDomain: 'infoverse-207c6.firebaseapp.com',
    projectId: 'infoverse-207c6',
    storageBucket: 'infoverse-207c6.appspot.com',
    appId: '1:340146502722:web:7c23eff5459832459341db',
    messagingSenderId: '340146502722',

  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgqM5YJu94ujG8wLzFlWbdD-4mcEbZ4wA',
    appId: '1:340146502722:android:41e063252c079e339341db',
    messagingSenderId: '340146502722',
    projectId: 'infoverse-207c6',
    storageBucket: 'infoverse-207c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK34WLZKufXlhIVwO4_Uj1RYlzX6Fja8c',
    appId: '1:340146502722:ios:0a1475384239edd69341db',
    messagingSenderId: '340146502722',
    projectId: 'infoverse-207c6',
    storageBucket: 'infoverse-207c6.appspot.com',
    iosBundleId: 'com.example.fypApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBK34WLZKufXlhIVwO4_Uj1RYlzX6Fja8c',
    appId: '1:340146502722:ios:0a1475384239edd69341db',
    messagingSenderId: '340146502722',
    projectId: 'infoverse-207c6',
    storageBucket: 'infoverse-207c6.appspot.com',
    iosBundleId: 'com.example.fypApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAejgrYBNqHl1q7nO8RmMsPOHkvG3V1zwA',
    appId: '1:340146502722:web:0dd171113cb6572e9341db',
    messagingSenderId: '340146502722',
    projectId: 'infoverse-207c6',
    authDomain: 'infoverse-207c6.firebaseapp.com',
    storageBucket: 'infoverse-207c6.appspot.com',
  );
}