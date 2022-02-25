import 'package:flutter/material.dart';

import '../styles/color_constants.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 80),
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
