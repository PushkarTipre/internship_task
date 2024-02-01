import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task/models/reuseable_widgets/reuseable_login_signup_btn.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({
    required this.changeScreenToLogin,
    super.key,
    required this.changeScreenToSignup,
  });
  final void Function() changeScreenToLogin;
  final void Function() changeScreenToSignup;

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Learning-cuate.png',
            width: 650,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Learn Awesome Things',
                  style: GoogleFonts.alexandria(
                      fontSize: 32.0,
                      color: Color.fromARGB(255, 121, 57, 57),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Where education meets innovation',
                  style: GoogleFonts.alexandria(
                    fontSize: 26.0,
                    color: Color.fromARGB(255, 121, 57, 57),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Reuseable_Login_Signup_Btn(
                  onTap: widget.changeScreenToSignup, label: 'Signup'),
              Reuseable_Login_Signup_Btn(
                  onTap: widget.changeScreenToLogin, label: 'Login'),
            ],
          ),
        ],
      ),
    );
  }
}
