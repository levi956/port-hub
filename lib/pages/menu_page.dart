import 'package:flutter/material.dart';
import 'package:port_hub/utils/navigation/navigation.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../services/authentication.dart';
import '../utils/styles/color_constants.dart';
import 'onboarding_page.dart';
import 'user/view_profile_page.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageFb0(
      imagePath: 'assets/images/background2.png',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/porthub.png',
                      height: 29.34, width: 168.52),
                  InkWell(
                    onTap: () {
                      pop(context);
                    },
                    child: Container(
                      //margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: white.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Image.asset('assets/images/x_button.png',
                          height: 17.52, width: 17.52),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              textButton('Profile', () {
                pushTo(context, const ViewProfile());
              }),
              textButton('Notifications', () {}),
              textButton('Portals', () {}),
              textButton('Help', () {}),
              textButton('Logout', () {
                goOut();
              })
            ],
          ),
        ),
      ),
    );
  }

  Container textButton(String buttonText, Function()? onPressed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 50,
      width: 170,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void goOut() {
    // uid = FirebaseAuth.instance.currentUser?.uid;
    // print(uid);
    Auth.signOut();
    pushToAndClearStack(context, const Onboarding());
  }
}
