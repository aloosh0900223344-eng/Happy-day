import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxxx', // سيتم استبداله من google-services.json
    appId: '1:123456789:android:xxxxx',
    messagingSenderId: '123456789',
    projectId: 'happy-day-app',
    storageBucket: 'happy-day-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxxx',
    appId: '1:123456789:ios:xxxxx',
    messagingSenderId: '123456789',
    projectId: 'happy-day-app',
    storageBucket: 'happy-day-app.appspot.com',
  );

  static FirebaseOptions get currentPlatform {
    return android;
  }
}
