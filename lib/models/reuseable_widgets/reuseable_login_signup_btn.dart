import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reuseable_Login_Signup_Btn extends StatelessWidget {
  const Reuseable_Login_Signup_Btn(
      {super.key, required this.onTap, required this.label});
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 170,
            child: ElevatedButton(
              onPressed: onTap,
              child: Text(
                label,
                style: GoogleFonts.alexandria(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        bottomRight: Radius.elliptical(30, 30))),
                backgroundColor: Color.fromARGB(255, 218, 148, 135),
                //padding: EdgeInsets.all(13.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(-50, -50),
                    topLeft: Radius.elliptical(-50, -50),
                  ),
                )*/
