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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrs5xEH0Tc-JEjPCDd5bgTA6Afg6WbtC0',
    appId: '1:788465611686:android:9acdf7af6b100a0d7ad567',
    messagingSenderId: '788465611686',
    projectId: 'balldon-tlie',
    storageBucket: 'balldon-tlie.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvFloZzdhGpbec2Kb0O0Bi-FBh2OVD4Kg',
    appId: '1:788465611686:ios:81f828dda773c93f7ad567',
    messagingSenderId: '788465611686',
    projectId: 'balldon-tlie',
    storageBucket: 'balldon-tlie.appspot.com',
    androidClientId: '788465611686-fqh45tk3ngohtt2f149ngur492n83vkf.apps.googleusercontent.com',
    iosClientId: '788465611686-vvv1dm4adpag4s9tuaje65otj5l0up7s.apps.googleusercontent.com',
    iosBundleId: 'com.priyanshunaskar.balldontlie',
  );
}
