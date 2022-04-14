import 'package:flutter/material.dart';
import 'package:port_hub/pages/home_page.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../services/database_methods.dart';
import '../utils/navigation/navigation.dart';
import '../utils/widgets/bottom_sheet.dart';
import '../utils/widgets/buttons.dart';
import '../utils/widgets/custom_textfield.dart';
import '../utils/widgets/progress_indicator.dart';
import '../utils/widgets/user_image.dart';

class SignUpCredentials extends StatefulWidget {
  const SignUpCredentials({Key? key}) : super(key: key);

  @override
  State<SignUpCredentials> createState() => _SignUpCredentialsState();
}

class _SignUpCredentialsState extends State<SignUpCredentials> {
  DatabaseMethods databaseMethods = DatabaseMethods();
  final _matricNo = TextEditingController();
  final _level = TextEditingController();
  final _hostel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundImageFb0(
      imagePath: 'assets/images/background1.png',
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: databaseMethods.getName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('an error has occured '),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as String;
                      return Text(
                        "Hello $data",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      );
                    }
                  }
                  return const CircularProgressIndicator.adaptive();
                },
              ),
              const Text(
                'Welcome to Port-hub',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              // the user image ui
              //should think about functionality later
              const SetUserImage(
                imagePath: 'https://i.ibb.co/tpWn6w2/account.png',
                onClicked: null,
              ),
              const SizedBox(height: 20),
              CustomInputFieldFb1(
                inputController: _matricNo,
                hintText: 'Matriculation Number',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your matriculation number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomInputFieldFb1(
                inputController: _level,
                hintText: 'Level',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current level';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomInputFieldFb1(
                inputController: _hostel,
                hintText: 'Hostel (Luke 50)',
                isHiddenText: false,
                validatorR: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your hostel name and room number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: OutlineButtonFb1(
                  text: 'Save',
                  onPressed: () {
                    updateRecords();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  updateRecords() async {
    showLoader(context);
    await databaseMethods.uploadUserInfo({
      "matricNo": _matricNo.text.trim(),
      "level": _level.text.trim(),
      "hostel": _hostel.text.trim(),
    });

    pop(context);
    await showResponseBottomSheet(context, 'Account Successfully Created');
    pop(context);
    pushToAndClearStack(context, const HomePage());
  }
}
