import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:signin/About.dart';
import 'package:signin/Canteen.dart';
//import 'package:signin/E_books.dart';
import 'package:signin/Library_books.dart';
import 'package:signin/Notice_board_screen.dart';
import 'package:signin/Online_courses.dart';
import 'package:signin/attendance/home.dart';
import 'package:signin/profile.dart';
import 'package:signin/screens/signin_screen.dart';
import 'package:share/share.dart';
import 'package:signin/settings_screen.dart';
import 'package:signin/share_screen.dart';

class menuscreen extends StatelessWidget {
  List<String> buttonnames = [
    "Notice board",
    'Attendance',
    'Online courses',
    'Canteen',
    'Library books',
    'About',
  ];
  List<Color> buttoncolors = [
    const Color.fromARGB(255, 40, 97, 143),
    const Color.fromARGB(255, 60, 143, 63),
    const Color.fromARGB(255, 211, 112, 145),
    const Color.fromARGB(255, 214, 106, 70),
    const Color.fromARGB(255, 243, 147, 4),
    const Color.fromARGB(255, 209, 236, 52),
  ];

  List<Icon> buttonicons = [
    const Icon(Icons.message, color: Colors.white, size: 50),
    const Icon(Icons.group, color: Colors.white, size: 50),
    const Icon(Icons.book, color: Colors.white, size: 50),
    const Icon(Icons.food_bank, color: Colors.white, size: 50),
    const Icon(Icons.my_library_books, color: Colors.white, size: 50),
    const Icon(Icons.other_houses, color: Colors.white, size: 50)
  ];

  menuscreen({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 230, 193),
      appBar: AppBar(
        elevation: 10,
        title: const Text("My College app"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                  FirebaseAuth.instance.currentUser?.displayName ??
                      'User Name'),
              accountEmail: Text(FirebaseAuth.instance.currentUser?.email ??
                  'user@example.com'),
              currentAccountPicture: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser?.photoURL ?? ''),
                  backgroundColor: const Color.fromARGB(255, 247, 243, 243),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                " My profile",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()),
);
              },
            ),
           ListTile(
  leading: const Icon(Icons.share),
  title: const Text(
    "Share",
    style: TextStyle(fontSize: 15),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShareScreen()),
    );
  },
),

            ListTile(
  leading: const Icon(Icons.settings),
  title: const Text(
    "Settings",
    style: TextStyle(fontSize: 15),
  ),
  onTap: () {
   
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  },
),

ListTile(
  leading: const Icon(Icons.phone),
  title: const Text(
    "Contact Us",
    style: TextStyle(fontSize: 15),
  ),
  onTap: () {
    // Close the drawer
    Navigator.pop(context);

    // Implement the logic for contacting your support team or displaying contact information
    // You can show a dialog, navigate to a contact screen, or perform any other action here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Contact Us"),
          content: const Text("For support, please contact us at support@myapp.com"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  },
),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                "Signout",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                
                               Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return SignInScreen();
                          }),
                        );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: buttonnames.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final buttonName = buttonnames[index];
                    final buttonIcon = buttonicons[index];
                    Widget destinationScreen;

                    if (index == 0) {
                      destinationScreen = const NoticeBoard();
                    } else if (index == 1) {
                      destinationScreen = MyApp();
                    } else if (index == 2) {
                      destinationScreen = courses();
                    } else if (index == 3) {
                      destinationScreen = Canteen();
                    } else if (index == 4) {
                      destinationScreen = Librarybooks();
                    } else if (index == 5) {
                      destinationScreen = const About();
                    } else {
                      destinationScreen = Container(); // or any default screen
                    }
                    return InkResponse(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return destinationScreen;
                          }),
                        );
                      },
                      splashColor: Colors
                          .transparent, // Set the splash color to transparent
                      containedInkWell:
                          true, // This will ensure the ink response stays within the bounds of the icon
                      highlightShape: BoxShape.circle,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: buttoncolors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: buttonIcon),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            buttonName,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(179, 9, 2, 2)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
