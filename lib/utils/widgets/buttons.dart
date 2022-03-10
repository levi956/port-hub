import 'package:flutter/material.dart';
import 'package:port_hub/utils/styles/color_constants.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color buttonColor;
  final Color? buttonTextColor;

  const BlueButton(
      {required this.text,
      required this.onPressed,
      required this.buttonColor,
      this.buttonTextColor,
      Key? key})
      : super(key: key);

  final double borderRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 15, bottom: 15),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class OutlineButtonFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const OutlineButtonFb1(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = lightBlue;

    const double borderRadius = 15;

    return SizedBox(
      height: 50,
      width: 170,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: primaryColor),
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: primaryColor, width: 1.4),
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
