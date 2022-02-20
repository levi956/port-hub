import 'package:flutter/material.dart';

class BackgroundImageFb0 extends StatelessWidget {
  final Widget child;
  final String imagePath;
  const BackgroundImageFb0(
      {required this.child, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
