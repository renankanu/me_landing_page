import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

FirebaseOptions get platformOptions {
  if (kIsWeb) {
    return const FirebaseOptions(
      appId: '1:812718951261:web:e01caf5a8ab4847a3b36b4',
      apiKey: 'AIzaSyAHX5RE0ihVqQJM_h6rYmdasFdopwi6xYY',
      projectId: 'me-landing-page-renankanu',
      messagingSenderId: '812718951261',
    );
  } else if (Platform.isIOS || Platform.isMacOS) {
    return const FirebaseOptions(
      appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
      apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
      projectId: 'react-native-firebase-testing',
      messagingSenderId: '448618578101',
      iosBundleId: 'io.flutter.plugins.firebasecoreexample',
    );
  } else {
    return const FirebaseOptions(
      appId: '1:448618578101:android:0446912d5f1476b6ac3efc',
      apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
      projectId: 'react-native-firebase-testing',
      messagingSenderId: '448618578101',
    );
  }
}
