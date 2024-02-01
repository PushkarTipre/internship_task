import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_task/Screens/dashboard_screen.dart';
import 'package:internship_task/Screens/login_screen.dart';
import '../date_control.dart';
import '../reuseable_widgets/reuseable_login_signup_btn_acc.dart';
import '../reuseable_widgets/reuseable_login_signup_btn_main.dart';
import '../reuseable_widgets/reuseable_text_tile.dart';
import '../reuseable_widgets/reuseable_textfields.dart';

final _firebase = FirebaseAuth.instance;

class Signup_Screen_Design_Logic extends StatefulWidget {
  const Signup_Screen_Design_Logic({
    super.key,
    required this.onTapDate,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required DateTime? selectedDate,
  })  : first_name_controller = firstNameController,
        _lastController = lastNameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _selectedDate = selectedDate;

  final TextEditingController first_name_controller;
  final TextEditingController _lastController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final DateTime? _selectedDate;
  final void Function() onTapDate;

  @override
  State<Signup_Screen_Design_Logic> createState() =>
      _Signup_Screen_Design_LogicState();
}

class _Signup_Screen_Design_LogicState
    extends State<Signup_Screen_Design_Logic> {
  final _formKey = GlobalKey<FormState>();
  var enteredEmailAddress = '';
  var enteredPassword = '';

  Future<void> signupUsers() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    try {
      final userCred = await _firebase.createUserWithEmailAndPassword(
          email: enteredEmailAddress, password: enteredPassword);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => Dashboard_Screen()));
      print(userCred);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use' ||
          error.code == '**invalid-email**') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: Text('Main_Logo'),
            child: Image.asset(
              'assets/images/Learning-bro.png',
              width: 250,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 229, 117, 117),
                  Color.fromARGB(255, 157, 10, 10),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Signup',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Enter your Account Details',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Scroll for more',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Reuseable_Text_Tile(textTile: 'Enter your First Name'),
                    Reuseable_TextFields(
                        controller: widget.first_name_controller,
                        text: 'Enter First Name',
                        icon: Icons.person,
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter Your Name';
                          } else if (value.contains(RegExp(
                              r'[!@#<>?":_``~;\[\]\|=\-+\)(*&^%1234567890]'))) {
                            return 'Enter a Valid Name (without special characters or numbers)';
                          }
                          return null;
                        },
                        save: (value) {}),
                    Reuseable_Text_Tile(textTile: 'Enter your Last Name'),
                    Reuseable_TextFields(
                        controller: widget._lastController,
                        text: 'Enter Last Name',
                        icon: Icons.person,
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter Your Name';
                          } else if (value.contains(RegExp(
                              r'[!@#<>?":_``~;\[\]\|=\-+\)(*&^%1234567890]'))) {
                            return 'Enter a Valid Name (without special characters or numbers)';
                          }
                          return null;
                        },
                        save: (value) {}),
                    Reuseable_Text_Tile(textTile: 'Enter your Email'),
                    Reuseable_TextFields(
                        controller: widget._emailController,
                        text: 'Enter Email',
                        icon: Icons.mail,
                        isPassword: false,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        save: (value) {
                          enteredEmailAddress = value!;
                        }),
                    Reuseable_Text_Tile(textTile: 'Enter your Password'),
                    Reuseable_TextFields(
                        controller: widget._passwordController,
                        text: 'Enter Password',
                        icon: Icons.lock,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Password must be at least 6 characters long. ';
                          }
                          return null;
                        },
                        save: (value) {
                          enteredPassword = value!;
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          style: TextStyle(color: Colors.white, fontSize: 22),
                          widget._selectedDate == null
                              ? 'Select Date of Birth ->'
                              : formatter.format(widget._selectedDate!),
                        ),
                        IconButton(
                          onPressed: widget.onTapDate,
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Reuseable_Login_Signup_Btn_Main(
                        label: 'Register', changeScreen: signupUsers),
                    SizedBox(
                      height: 26.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have a account?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Reuseable_Login_Signup_Btn_Acc(
                          label: 'Login',
                          changeScreen: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => Login_Screen(),
                              ),
                            );
                          },
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
