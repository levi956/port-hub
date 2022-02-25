import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port_hub/utils/widgets/chat_box.dart';
import 'package:port_hub/utils/widgets/custom_appbar.dart';

import '../models/messages.dart';
import '../utils/styles/color_constants.dart';

class Chat extends StatelessWidget {
  final Message? message;
  const Chat({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBlue,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 45),
              child: Row(
                children: [
                  Text(
                    ('${message!.user!.firstName!}\n${message!.user!.lastName}'),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: white),
                  ),
                  const Spacer(),
                  iconButton(
                      iconData: const Icon(CupertinoIcons.phone),
                      onPressed: () {}),
                  iconButton(
                      iconData: const Icon(CupertinoIcons.videocam),
                      onPressed: () {}),
                ],
              ),
            ),
            const ChatBox()
          ],
        ),
      ),
    );
  }
}

Container iconButton({Icon? iconData, Function()? onPressed}) {
  return Container(
    margin: const EdgeInsets.only(right: 20),
    padding: EdgeInsets.zero,
    decoration:
        BoxDecoration(color: white.withOpacity(0.3), shape: BoxShape.circle),
    child: IconButton(
      onPressed: onPressed,
      icon: iconData!,
      iconSize: 25,
      color: white,
    ),
  );
}
