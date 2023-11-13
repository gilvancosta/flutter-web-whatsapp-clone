import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import "src/app.dart";

String firstRoute = "/";

Future<void> main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyArlET0tc-QT3tGkThlgVzHBm59T-ibHBY",
      authDomain: "whatsapp-clone-a361f.firebaseapp.com",
      projectId: "whatsapp-clone-a361f",
      storageBucket: "whatsapp-clone-a361f.appspot.com",
      messagingSenderId: "834491289105",
      appId: "1:834491289105:web:76c464d6a6435715f56bb0",
    ),
  );

  User? currentFirebaseUser = FirebaseAuth.instance.currentUser;

  if (currentFirebaseUser != null) {
    firstRoute = "/home";
  }
  runApp(const MyApp());
}
