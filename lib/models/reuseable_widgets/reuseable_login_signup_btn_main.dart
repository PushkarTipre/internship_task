import 'package:flutter/material.dart';

class Reuseable_Login_Signup_Btn_Main extends StatelessWidget {
  Reuseable_Login_Signup_Btn_Main(
      {required this.label, required this.changeScreen});

  String label;
  Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeScreen();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(50, 50),
              bottomRight: Radius.elliptical(50, 50)),
          color: Colors.white.withOpacity(0.4),
        ),
        margin: EdgeInsets.symmetric(horizontal: 80),
        height: 40.0,
        width: double.infinity,
        child: Center(
            child: Text(
          label,
          style: TextStyle(
              color: Colors.white.withOpacity(1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
