import 'package:flutter/material.dart';
import 'package:port_hub/pages/sign_up.dart';
import 'package:port_hub/utils/navigation/navigation.dart';
import 'package:port_hub/utils/widgets/background_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:port_hub/utils/widgets/buttons.dart';

import '../utils/status_bar_color.dart';
import '../utils/styles/color_constants.dart';
import 'login_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool showSignIn = true;
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return BackgroundImageFb0(
      imagePath: 'assets/images/background1.png',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connect with your \nHall Assistant with \nEase!',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ),
              Center(
                child: Image.asset('assets/images/illustration1.png',
                    height: 264.71, width: 252),
              ),
              const SizedBox(height: 50),
              Center(
                child: BlueButton(
                    text: 'Login',
                    onPressed: () {
                      pushTo(context, const Login());
                    },
                    buttonColor: lightBlue),
              ),
              const SizedBox(height: 15),
              Center(
                child: OutlineButtonFb1(
                  text: 'SignUp',
                  onPressed: () {
                    pushTo(context, const SignUp());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
