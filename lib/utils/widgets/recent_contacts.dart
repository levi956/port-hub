import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../styles/color_constants.dart';

class RecentContacts extends StatelessWidget {
  final contactList = Users.generateUsers();
  RecentContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 25),
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white.withOpacity(0.3), shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              size: 30,
              color: white,
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      // height: 50,
                      margin: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage(contactList[index]!.profilePhoto!),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white, width: 2.0),
                      ),
                    ),
                // separatorBuilder: (_, index) => const SizedBox(),
                itemCount: contactList.length),
          )
        ],
      ),
    );
  }
}
