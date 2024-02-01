import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_task/Screens/dashboard_screen.dart';
import 'package:internship_task/Screens/login_screen.dart';
import 'package:internship_task/Screens/splash_screen.dart';
import 'package:internship_task/firebase_options.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MaterialApp(
      theme: theme,
      home: StreamBuilder(
          key: UniqueKey(),
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Splash_Screen();
            }
            if (snapshot.hasData) {
              return Dashboard_Screen();
            }
            return Login_Screen();
          }),
    ),
  );
}
