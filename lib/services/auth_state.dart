import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:port_hub/utils/widgets/message_toast.dart';

import '../pages/home_page.dart';
import '../pages/onboarding_page.dart';

class AuthenticationState extends StatelessWidget {
  const AuthenticationState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = FirebaseAuth.instance;
    return StreamBuilder<User?>(
      stream: authState.authStateChanges(),
      builder: (context, myState) {
        if (myState.connectionState == ConnectionState.waiting) {
        } else if (myState.hasError) {
          showErrorToast('Something went wrong');
        } else if (myState.hasData) {
          return const HomePage();
        } else {
          return const Onboarding();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
