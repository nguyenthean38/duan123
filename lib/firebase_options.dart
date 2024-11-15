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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvwG1pAAhN6GMFdOcGUBtwGRhpagMOJ9E',
    appId: '1:649070503522:android:8edb10a9e162013b4c933b',
    messagingSenderId: '649070503522',
    projectId: 'duanflutter',
    storageBucket: 'duanflutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPBs_VQans-0F16GWv3pmQoIKViPfbeuE',
    appId: '1:649070503522:ios:d182e3281f16eb204c933b',
    messagingSenderId: '649070503522',
    projectId: 'duanflutter',
    storageBucket: 'duanflutter.firebasestorage.app',
    iosBundleId: 'com.example.flutterEnd',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDLoXCfWbNkpWi5p2OUFKyZnDdT8uxDms8',
    appId: '1:649070503522:web:3f4826da2d3bd43a4c933b',
    messagingSenderId: '649070503522',
    projectId: 'duanflutter',
    authDomain: 'duanflutter.firebaseapp.com',
    storageBucket: 'duanflutter.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPBs_VQans-0F16GWv3pmQoIKViPfbeuE',
    appId: '1:649070503522:ios:d182e3281f16eb204c933b',
    messagingSenderId: '649070503522',
    projectId: 'duanflutter',
    storageBucket: 'duanflutter.firebasestorage.app',
    iosBundleId: 'com.example.flutterEnd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLoXCfWbNkpWi5p2OUFKyZnDdT8uxDms8',
    appId: '1:649070503522:web:aa8fef3f72d16cd44c933b',
    messagingSenderId: '649070503522',
    projectId: 'duanflutter',
    authDomain: 'duanflutter.firebaseapp.com',
    storageBucket: 'duanflutter.firebasestorage.app',
  );

}