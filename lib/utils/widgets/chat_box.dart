import 'package:flutter/material.dart';

import '../../models/messages.dart';
import '../styles/color_constants.dart';

class ChatBox extends StatelessWidget {
  final myId = 0;
  final list = Message.generateMessageFromFirstUser();
  final _scrollController = ScrollController();
  ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageList = List.from(list.reversed);
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
              child: ListView.separated(
                reverse: true,
                controller: _scrollController,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    messageList[index]!.user?.id == myId
                        ? _buildRecievedText(messageList[index])
                        : _buildSenderText(messageList[index]),
                separatorBuilder: (BuildContext context, index) =>
                    const SizedBox(height: 20),
                itemCount: messageList.length,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 50,
                width: 300,
                child: Stack(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: grey.withOpacity(0.7),
                        filled: true,
                        contentPadding: const EdgeInsets.all(18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        hintText: 'Type your message.... ',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: homeBlue),
                        child: Icon(Icons.send, color: white, size: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRecievedText(Message? message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message!.lastTime!,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: chatBlue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
              bottomLeft: Radius.circular(17),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              message.lastMessage!,
              style: const TextStyle(height: 1.5),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSenderText(Message? message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child: CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage(message!.user!.profilePhoto!),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.lightBlue, width: 2.0),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: grey.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Text(
                  message.lastMessage!,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            )
          ],
        ),
        Text(
          message.lastTime!,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
