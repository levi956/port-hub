import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:port_hub/utils/navigation/navigation.dart';

import '../../models/messages.dart';
import '../../models/user.dart';
import '../../pages/chats_page.dart';
import '../../services/database_methods.dart';
import '../styles/color_constants.dart';

class RecentMessages extends StatefulWidget {
  const RecentMessages({Key? key}) : super(key: key);

  @override
  State<RecentMessages> createState() => _RecentMessagesState();
}

class _RecentMessagesState extends State<RecentMessages> {
  var uid = FirebaseAuth.instance.currentUser?.uid;

  DatabaseMethods myDatabase = DatabaseMethods();

  Future funcThatMakesAsyncCall() async {
    var result = await myDatabase.getName2();
    setState(() {
      result = result;
    });
    return result.toString();
    // setState(() {
    //   String someVal = result;
    //   print(someVal);
    //   return someVal.toString();
    // });
  }

  // @override
  // initState() {
  //   funcThatMakesAsyncCall();
  //   super.initState();
  // }

//   myDatabase.getName2().then((result) {
//   print(result);
//   setState(() {
//     someVal = result;
//   })
// })

  // FutureBuilder<String> getNameFuture() {
  //   return FutureBuilder(
  //     future: myDatabase.getName2(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (snapshot.hasError) {
  //           return const Center(
  //             child: Text('an error has occured '),
  //           );
  //         } else if (snapshot.hasData) {
  //           final data = snapshot.data as String;
  //           return const SizedBox.shrink();
  //         }
  //       }
  //       return const CircularProgressIndicator.adaptive();
  //     },
  //   );
  // }

  // creating the stream here
  Stream<List<Users>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      // modify where to user itself field
      // .where('firstName', isNotEqualTo: funcThatMakesAsyncCall())
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());

  final messageList = Message.generateHomePageMessage();

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

        // creating the stream that gets data from users document
        child: StreamBuilder<List<Users>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            // collection data returns a list type data (NOTE)
            final List<Users> recentUsers = snapshot.data!;

            if (recentUsers.isEmpty) {
              return const Center(
                child: Text('No friends'),
              );
            }

            // so creating a listview depeding on that lenght of
            // collection list document it returns
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => _buildMessage(context, index),
                separatorBuilder: (_, index) => const SizedBox(height: 30),
                itemCount: recentUsers.length);
          },
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context, int index) {
    return StreamBuilder<List<Users>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        final List<Users> recentUsers = snapshot.data!;

        if (recentUsers.isEmpty) {
          return const Center(
            child: Text('No list'),
          );
        }

        Users user = recentUsers[index];

        return InkWell(
          onTap: () {
            pushTo(context, Chat(userNameChatScreen: user));
          },
          child: Row(
            children: [
              Container(
                child: const CircleAvatar(
                  radius: 30,
                  // backgroundImage:
                  //     AssetImage(messageList[index]!.user!.profilePhoto!),
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
                          "${user.firstName}",
                          // messageList[index]!.user!.firstName.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${user.lastName}",
                          // messageList[index]!.user!.lastName.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Spacer(),

                        // Text(

                        //   [index]!.lastTime!),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: homeBlue,
                        )
                      ],
                    ),
                    Text(
                      "${user.lastMessage}",
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
