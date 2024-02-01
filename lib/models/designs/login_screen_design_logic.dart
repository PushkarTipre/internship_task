import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Screens/dashboard_screen.dart';
import '../../Screens/signup_screen.dart';
import '../reuseable_widgets/reuseable_login_signup_btn_acc.dart';
import '../reuseable_widgets/reuseable_login_signup_btn_main.dart';
import '../reuseable_widgets/reuseable_text_tile.dart';
import '../reuseable_widgets/reuseable_textfields.dart';

final _firebase = FirebaseAuth.instance;

class Login_Screen_Design_Logic extends StatefulWidget {
  const Login_Screen_Design_Logic({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : super(key: key);

  @override
  State<Login_Screen_Design_Logic> createState() =>
      _Login_Screen_Design_LogicState();
}

class _Login_Screen_Design_LogicState extends State<Login_Screen_Design_Logic> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> LoginUsers() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    try {
      final userCred = await _firebase.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
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
              width: 350,
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
                      'Login',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Enter your Account Details',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Reuseable_Text_Tile(textTile: 'Enter your Email'),
                    Reuseable_TextFields(
                        controller: emailController,
                        text: 'Enter Email',
                        icon: Icons.email,
                        isPassword: false,
                        validator: (value) {},
                        save: (value) {}),
                    Reuseable_Text_Tile(textTile: 'Enter your Password'),
                    Reuseable_TextFields(
                        controller: passwordController,
                        text: 'Enter Password',
                        icon: Icons.lock,
                        isPassword: true,
                        validator: (value) {},
                        save: (value) {}),
                    SizedBox(
                      height: 28.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Reuseable_Login_Signup_Btn_Main(
                        label: 'Login', changeScreen: LoginUsers),
                    SizedBox(
                      height: 26.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have a account?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Reuseable_Login_Signup_Btn_Acc(
                          label: 'Signup',
                          changeScreen: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Signup_Screen()));
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
