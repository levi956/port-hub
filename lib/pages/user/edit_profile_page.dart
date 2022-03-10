import 'package:flutter/material.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../../utils/navigation/navigation.dart';
import '../../utils/status_bar_color.dart';
import '../../utils/widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    final _newNameController = TextEditingController();
    final _newLevelController = TextEditingController();
    final _newHostelController = TextEditingController();
    final _newEmailController = TextEditingController();

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
                  const Text('Save')
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
                inputController: _newNameController,
                hintText: 'Nifesi Odumirin',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomInputFieldFb1(
                inputController: _newLevelController,
                hintText: '400L',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomInputFieldFb1(
                inputController: _newHostelController,
                hintText: 'Nh room 15',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomInputFieldFb1(
                inputController: _newEmailController,
                hintText: 'nifesiodumirin@gmail.com',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
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
