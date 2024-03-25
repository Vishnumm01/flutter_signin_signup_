// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class courses extends StatelessWidget {
  courses({Key? key}) : super(key: key);

  // Define a list of course data
  final List<Map<String, String>> Courses = [
    {
      'title': 'NPTEL/Swayam',
      'url': 'https://swayam.gov.in/nc_details/NPTEL',
    },
    {
      'title': 'Coursera',
      'url': 'https://www.coursera.org/login',
    },
    {
      'title': 'Udemy',
      'url': 'https://www.udemy.com/join/login-popup/',
    },
     {
      'title': 'edx',
      'url': 'https://www.edx.org/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Courses")),
      backgroundColor: Color.fromARGB(255, 239, 230, 151),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Text(
                  'Online Courses Platforms',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Use ListView.builder to dynamically generate course options
            Expanded(
              child: ListView.builder(
                itemCount: Courses.length,
                itemBuilder: (context, index) {
                  final course = Courses[index];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 100, 10),
                    child: GestureDetector(
                      onTap: () {
                        launch(course['url']!);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_right_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            course['title']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
