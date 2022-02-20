import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:port_hub/pages/home_page.dart';
import 'package:port_hub/pages/onboarding_page.dart';

void main() {
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

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
      home: const HomePage(),
    );
  }
}
