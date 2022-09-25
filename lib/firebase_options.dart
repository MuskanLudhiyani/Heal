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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDESDOsrWUX4DmC3uBafMq7lAm7NnDe1k4',
    appId: '1:915687981784:web:79453ae69dd0b0f04dcdad',
    messagingSenderId: '915687981784',
    projectId: 'heal-d6037',
    authDomain: 'heal-d6037.firebaseapp.com',
    storageBucket: 'heal-d6037.appspot.com',
    measurementId: 'G-FBJPF7G19J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgqPtP9b2pVTWANUwnDALPcjDCdaKQyFQ',
    appId: '1:915687981784:android:ba3cd2eb9c760ba14dcdad',
    messagingSenderId: '915687981784',
    projectId: 'heal-d6037',
    storageBucket: 'heal-d6037.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvIdCtyvC_NpZ1dSmj5yITRZ5F_B2YdtM',
    appId: '1:915687981784:ios:595a3b630826eb3c4dcdad',
    messagingSenderId: '915687981784',
    projectId: 'heal-d6037',
    storageBucket: 'heal-d6037.appspot.com',
    iosClientId: '915687981784-862kqun8iec6vens0on4i90tpbja8gmf.apps.googleusercontent.com',
    iosBundleId: 'com.example.heal',
  );
}