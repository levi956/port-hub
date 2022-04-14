import 'dart:math';

import 'package:flutter/material.dart';
import 'package:port_hub/models/user.dart';
import 'package:port_hub/utils/widgets/background_image.dart';
import 'package:port_hub/utils/widgets/progress_indicator.dart';

import '../../services/database_methods.dart';
import '../../utils/navigation/navigation.dart';
import '../../utils/status_bar_color.dart';
import '../../utils/widgets/bottom_sheet.dart';
import '../../utils/widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _newFirstNameController = TextEditingController();
  final _newLastNameController = TextEditingController();
  final _newLevelController = TextEditingController();
  final _newHostelController = TextEditingController();
  final _newEmailController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 100), 0);

    return BackgroundImageFb0(
      imagePath: 'assets/images/background1.png',
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 50, bottom: bottom),
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
                    GestureDetector(
                      // do front end validation here
                      onTap: () => updateRecords(),
                      child: const Text('Save'),
                    )
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
                const SizedBox(height: 30),
                CustomInputFieldFb1(
                  inputController: _newFirstNameController,
                  hintText: 'First Name',
                  isHiddenText: false,
                  validatorR: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputFieldFb1(
                  inputController: _newLastNameController,
                  hintText: 'Surname',
                  isHiddenText: false,
                  validatorR: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputFieldFb1(
                  inputController: _newLevelController,
                  hintText: 'Level',
                  isHiddenText: false,
                  validatorR: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputFieldFb1(
                  inputController: _newHostelController,
                  hintText: 'Hostel and Room number',
                  isHiddenText: false,
                  validatorR: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your hostel and room number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputFieldFb1(
                  inputController: _newEmailController,
                  hintText: 'Confirm your email address',
                  isHiddenText: false,
                  validatorR: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateRecords() async {
    showLoader(context);
    await databaseMethods.updateUserInfo(
      Users(
        firstName: _newFirstNameController.text.trim(),
        lastName: _newLastNameController.text.trim(),
        level: _newLevelController.text.trim(),
        hostel: _newHostelController.text.trim(),
        email: _newEmailController.text.trim(),
      ),
    );
    pop(context);
    await showResponseBottomSheet(context, 'Account Successfully Updated');
    pop(context);
  }
}
