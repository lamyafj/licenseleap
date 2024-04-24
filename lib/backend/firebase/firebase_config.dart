import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQTat3X6Rf-NOPBZv8PyekYC6Fb8Kd9sg",
            authDomain: "licenseleap.firebaseapp.com",
            projectId: "licenseleap",
            storageBucket: "licenseleap.appspot.com",
            messagingSenderId: "875430247155",
            appId: "1:875430247155:web:2f1c8d3bf31bae27cfd586",
            measurementId: "G-7XGNMF33RM"));
  } else {
    await Firebase.initializeApp();
  }
}
