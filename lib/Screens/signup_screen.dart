import 'package:flutter/material.dart';
import '../models/designs/signup_screen_design_logic.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    void presentDatePickcer() async {
      final now = DateTime.now();
      final firstDate = DateTime(now.year - 1, now.month, now.day);
      final pickedDate = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: now,
          initialDate: now);
      setState(() {
        selectedDate = pickedDate;
      });
    }

    return Signup_Screen_Design_Logic(
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      emailController: emailController,
      passwordController: passwordController,
      selectedDate: selectedDate,
      onTapDate: presentDatePickcer,
    );
  }
}
