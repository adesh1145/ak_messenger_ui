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
    apiKey: 'AIzaSyDlAXXQxRvnJ3OSpoDL0xE7l_Dc1w4sbkY',
    appId: '1:435247959347:web:9dac6c428b5bca07ed4246',
    messagingSenderId: '435247959347',
    projectId: 'ak-messenger-93e1f',
    authDomain: 'ak-messenger-93e1f.firebaseapp.com',
    storageBucket: 'ak-messenger-93e1f.appspot.com',
    measurementId: 'G-6902WSHZ5G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB6h9rL6RduHuiRlDcXWOJcm2Kwhio9b0',
    appId: '1:435247959347:android:8f35b11d9187ecb3ed4246',
    messagingSenderId: '435247959347',
    projectId: 'ak-messenger-93e1f',
    storageBucket: 'ak-messenger-93e1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDMDOLRXPO4UbTJofIhxoESDe-nRufEVc',
    appId: '1:435247959347:ios:b78fb06bd168ec99ed4246',
    messagingSenderId: '435247959347',
    projectId: 'ak-messenger-93e1f',
    storageBucket: 'ak-messenger-93e1f.appspot.com',
    iosBundleId: 'com.aktechnology.akmessenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDMDOLRXPO4UbTJofIhxoESDe-nRufEVc',
    appId: '1:435247959347:ios:d79a9840300dad1ded4246',
    messagingSenderId: '435247959347',
    projectId: 'ak-messenger-93e1f',
    storageBucket: 'ak-messenger-93e1f.appspot.com',
    iosBundleId: 'com.aktechnology.akmessenger.RunnerTests',
  );
}
