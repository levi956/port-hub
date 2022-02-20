import 'package:flutter/material.dart';
import 'package:port_hub/pages/sign_up.dart';
import 'package:port_hub/utils/styles/color_constants.dart';
import 'package:port_hub/utils/widgets/background_image.dart';

import '../utils/navigation/navigation.dart';
import '../utils/status_bar_color.dart';
import '../utils/widgets/buttons.dart';
import '../utils/widgets/custom_textfield.dart';
import 'onboarding_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _togglePasswordView() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool _isVisible = true;
  static final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
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
                    height: 40,
                  ),
                  Center(
                    child: Image.asset('assets/images/porthub.png',
                        height: 29.34, width: 166.52),
                  ),
                  const SizedBox(height: 70),
                  CustomInputFieldFb1(
                    inputController: _emailController,
                    hintText: 'Email',
                    isHiddenText: _isVisible,
                    validatorR: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomInputFieldFb1(
                    iconSuffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                    inputController: _passwordController,
                    hintText: 'Password',
                    isHiddenText: _isVisible,
                    validatorR: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: OutlineButtonFb1(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // onPressed function goes here
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          pushReplacementTo(context, const SignUp());
                        },
                        child: Text(
                          'SignUp',
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
    );
  }
}
