import 'package:flutter/material.dart';
import 'package:port_hub/utils/navigation/navigation.dart';

import '../styles/color_constants.dart';
import 'buttons.dart';

Future<void> showResponseBottomSheet(
    BuildContext context, String message) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(34),
      ),
    ),
    builder: (context) => ResponseButtomSheet(message: message),
  );
}

class ResponseButtomSheet extends StatelessWidget {
  final String? message;
  const ResponseButtomSheet({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 9),
              Container(
                width: 26,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFDADADA),
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
              const SizedBox(height: 75),
              Image.asset('assets/images/porthub.png',
                  height: 29.34, width: 166.52),
              const SizedBox(height: 40),
              Text(
                "$message",
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              BlueButton(
                  buttonTextColor: white,
                  text: 'Okay',
                  onPressed: () {
                    pop(context);
                  },
                  buttonColor: lightBlue),
              const SizedBox(height: 9),
              SizedBox(
                height: 20 + MediaQuery.of(context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
