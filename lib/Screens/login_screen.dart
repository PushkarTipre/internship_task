import 'package:flutter/material.dart';
import 'package:internship_task/models/designs/login_screen_design_logic.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Login_Screen_Design_Logic(
        emailController: _emailController,
        passwordController: _passwordController);
  }
}
