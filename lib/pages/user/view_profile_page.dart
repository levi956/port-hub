import 'package:flutter/material.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../../services/database_methods.dart';
import '../../utils/navigation/navigation.dart';
import '../../utils/status_bar_color.dart';
import 'edit_profile_page.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  DatabaseMethods myDatabase = DatabaseMethods();
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return BackgroundImageFb0(
      imagePath: 'assets/images/background1.png',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      pop(context);
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        pushTo(context, const EditProfile());
                      },
                      child: const Text('Edit Profile'))
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Image.asset('assets/images/porthub.png',
                    height: 29.34, width: 166.52),
              ),
              const Center(
                child: Text('User Profile'),
              ),
              FutureBuilder(
                future: myDatabase.getUserDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('an error has occured '),
                      );
                    } else if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          snapshot.data as Map<String, dynamic>;

                      // final data = snapshot.data as String;
                      return Column(
                        children: [
                          const SizedBox(height: 30),
                          userField('Name', '${data['firstName']}'),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 30),
                          userField('Level', '${data['level']}'),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 30),
                          userField('Hostel', '${data['hostel']}'),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 30),
                          userField('Matric no', '${data['matricNo']}'),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 30),
                          userField('Email', '${data['email']}'),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Row userField(String tag, String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tag),
        Text(username),
      ],
    );
  }
}
