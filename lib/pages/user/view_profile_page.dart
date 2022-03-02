import 'package:flutter/material.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../../utils/navigation/navigation.dart';
import '../../utils/status_bar_color.dart';
import 'edit_profile_page.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return BackgroundImageFb0(
      imagePath: 'assets/images/background1.png',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
              Center(
                child: Image.asset('assets/images/porthub.png',
                    height: 29.34, width: 166.52),
              ),
              const Center(
                child: Text('User Profile'),
              ),
              const SizedBox(height: 30),
              userField('Name', 'to read from user database'),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              userField('Level', 'Edit profile to enter level'),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              userField('Hostel', 'NH'),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              userField('Matric no', 'SCI/018/*****'),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              userField('Email', 'nifesiodumirin@gmail.com'),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 30),
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
