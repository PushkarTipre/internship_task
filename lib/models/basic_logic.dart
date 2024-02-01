import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_task/Screens/login_screen.dart';
import 'package:internship_task/Screens/welcome_screen.dart';

import '../Screens/signup_screen.dart';

class Basic_Logic extends StatefulWidget {
  const Basic_Logic({super.key});

  @override
  State<Basic_Logic> createState() => _Basic_LogicState();
}

class _Basic_LogicState extends State<Basic_Logic> {
  var activeScreenId = 'welcome-screen';

  void changeScreenToLogin() {
    setState(() {
      activeScreenId = 'login-screen';
    });
  }

  void changeScreenToSignup() {
    setState(() {
      activeScreenId = 'signup-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenChangeWidget = activeScreenId == 'welcome-screen'
        ? Welcome_Screen(
            changeScreenToLogin: changeScreenToLogin,
            changeScreenToSignup: changeScreenToSignup)
        : activeScreenId == 'login-screen'
            ? Login_Screen()
            : Signup_Screen(); // Add this line for the Signup screen

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: screenChangeWidget,
      ),
    );
  }
}
