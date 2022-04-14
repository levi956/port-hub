import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:port_hub/pages/login_page.dart';
import 'package:port_hub/pages/onboarding_page.dart';
import 'package:port_hub/pages/sign_up_credential.dart';
import 'package:port_hub/utils/styles/color_constants.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../models/user.dart';
import '../services/authentication.dart';
import '../services/database_methods.dart';
import '../utils/navigation/navigation.dart';
import '../utils/status_bar_color.dart';
import '../utils/widgets/buttons.dart';
import '../utils/widgets/custom_textfield.dart';
import '../utils/widgets/progress_indicator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible = true;
  DatabaseMethods databaseMethods = DatabaseMethods();

  void _togglePasswordView() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  static final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _newUserEmail = TextEditingController();
  final _newUserPassword = TextEditingController();
  final _newUserConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 100), 0);
    setStatusBarColor(color: BarColor.black);
    return GestureDetector(
      onTap: () {
        // dismisses keyboard on screen tap
        FocusScope.of(context).unfocus();
      },
      child: BackgroundImageFb0(
        imagePath: 'assets/images/background1.png',
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          pushToAndClearStack(context, const Onboarding());
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Image.asset('assets/images/porthub.png',
                            height: 29.34, width: 166.52),
                      ),
                      const SizedBox(height: 25),
                      CustomInputFieldFb1(
                        inputController: _firstName,
                        hintText: 'First Name',
                        isHiddenText: false,
                        validatorR: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Name cannot contain special characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFieldFb1(
                        inputController: _lastName,
                        hintText: 'Last Name',
                        isHiddenText: false,
                        validatorR: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Name cannot contain special characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFieldFb1(
                        inputController: _newUserEmail,
                        hintText: 'Email',
                        isHiddenText: false,
                        validatorR: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFieldFb1(
                        iconSuffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        inputController: _newUserPassword,
                        hintText: 'Password',
                        isHiddenText: _isVisible,
                        validatorR: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFieldFb1(
                        iconSuffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        inputController: _newUserConfirmPassword,
                        hintText: 'Confrim Password',
                        isHiddenText: _isVisible,
                        validatorR: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          String paassword = _newUserPassword.text;
                          if (paassword != _newUserConfirmPassword.text) {
                            return 'Paasswords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: OutlineButtonFb1(
                          text: 'SignUp',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              pushReplacementTo(context, const Login());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: lightBlue,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // signs up user and saves to database
  void signUp() async {
    showLoader(context);
    await Auth.signUp(
      _newUserEmail.text.trim(),
      _newUserPassword.text.trim(),
    );

    pop(context);

    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    } else {
      await databaseMethods.addUserInfo(Users(
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          email: _newUserEmail.text.trim()));
      pushToAndClearStack(context, const SignUpCredentials());
    }
  }
}


 // Map<String, String> userDetails = {
    //   "firstName": _firstNameController.text.trim(),
    //   "lastName": _lastNameController.text.trim(),
    //   "email": _newUserEmailController.text.trim(),
    // };