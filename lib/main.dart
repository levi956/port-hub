import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:port_hub/services/authentication_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

// to-do
// create screen after sign up for users to enter additional credential
// for the additional user screen option , add user photo
// finish user profile read and write operations

// finish UI for chat box itself and understand logic to fill data
// think about logic for the profile screen

void initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2)); // ✅
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'port-hub',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const AuthenticationState(),
    );
  }
}
