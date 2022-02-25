import 'package:flutter/material.dart';
import 'package:port_hub/utils/navigation/navigation.dart';

import '../../models/messages.dart';
import '../../pages/chats_page.dart';
import '../styles/color_constants.dart';

class RecentMessages extends StatelessWidget {
  final messageList = Message.generateHomePageMessage();
  RecentMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: _buildMessages(),
      ),
    );
  }

  Widget _buildMessages() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _buildMessage(context, index),
        separatorBuilder: (_, index) => const SizedBox(height: 30),
        itemCount: messageList.length);
  }

  Widget _buildMessage(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        pushTo(context, Chat(message: messageList[index]));
      },
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage(messageList[index]!.user!.profilePhoto!),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: homeBlue, width: 2.0),
            ),
          ),
          const SizedBox(width: 7),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      messageList[index]!.user!.firstName.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      messageList[index]!.user!.lastName.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    Text(messageList[index]!.lastTime!),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: homeBlue,
                    )
                  ],
                ),
                Text(
                  messageList[index]!.lastMessage.toString(),
                  style: const TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
