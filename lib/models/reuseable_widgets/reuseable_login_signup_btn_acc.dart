import 'package:flutter/material.dart';

class Reuseable_Login_Signup_Btn_Acc extends StatelessWidget {
  Reuseable_Login_Signup_Btn_Acc(
      {required this.label, required this.changeScreen, required this.margin});
  String label;
  Function changeScreen;
  EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen();
      },
      child: Container(
        margin: margin,
        height: 35.0,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(50, 50),
              bottomLeft: Radius.elliptical(50, 50)),
          color: Colors.white.withOpacity(0.6),
        ),
        child: Center(child: Text(label)),
      ),
    );
  }
}
