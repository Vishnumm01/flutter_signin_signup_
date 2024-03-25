import 'package:flutter/material.dart';
import 'package:signin/profile.dart';
import 'package:signin/screens/signin_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Settings'),
       
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: const Text('Privacy Settings'),
            onTap: () {
              // Add navigation logic here
              print('Navigate to Privacy Settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: const Text('Account Settings'),
            onTap: () {
              // Add navigation logic here
              print('Navigate to Account Settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Signout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
