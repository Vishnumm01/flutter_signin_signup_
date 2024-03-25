// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, file_names, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key); // Corrected syntax for the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About College")),
      backgroundColor: Color.fromARGB(255, 209, 177, 174),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Text(
                  'GPTC CHELAKKARA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Container(
                width: 400,
                height: 80,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/latest.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Text(
                'Established in 1999, Government Polytechnic College, Chelakkara is a reputed institute located in Thrissur, Kerala. A student can pursue these 5 courses as Diploma in Full Time mode. The institute offers diversified UG programs designed to meet the learning aspirations of students from various backgrounds.',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 30, 100, 40),
              child: GestureDetector( // Wrap the text with GestureDetector
                onTap: () {
                  launch('https://gpcchelakkara.infrastruct.in/course/index.php');
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
              
                  'Courses : --> ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                  color: Colors.blue,
                   decoration: TextDecoration.underline,
                   decorationColor: Colors.blue,
                   
                   ),
                   
                ),
      ]
              ),
              ),
            ),
          
          Padding(padding:EdgeInsetsDirectional.fromSTEB(10, 0, 20, 10),
     child: GestureDetector(
        onTap: () {
          launch('https://gpcchelakkara.infrastruct.in/'); 
        },
        child: Row(
      children: [
        Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(width: 5),
         Text(
          'gpcchelakkara.infrastruct.in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
            
            fontSize: 20,
            color: Colors.blue,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            
          ),
        
        ),
      ]
      ),
     ),
          ),
          ],
        ),
      ),
    );
  }

  
 
}

