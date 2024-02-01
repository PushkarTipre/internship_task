import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_task/Screens/login_screen.dart';
import 'package:internship_task/models/dummy_data.dart';
import 'package:internship_task/models/reuseable_widgets/dashboard_grid_item.dart';

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({super.key});

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('pushkartipre@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Learning-bro.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Edu Wallet'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(24.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            Dashboard_Grid_Item(dashboard: category),
        ],
      ),
    );
  }
}
