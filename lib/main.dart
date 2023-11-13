import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import "src/app.dart";

String firstRoute = "/";

Future<void> main() async {
  await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,


  
  );

  User? currentFirebaseUser = FirebaseAuth.instance.currentUser;

  if (currentFirebaseUser != null) {
    firstRoute = "/home";
  }
  runApp(const MyApp());
}
