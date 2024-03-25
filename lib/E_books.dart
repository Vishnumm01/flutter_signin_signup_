import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package for launching URLs

class ebooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildBox(
            Color.fromARGB(255, 8, 69, 120),
            'https://sitttrkerala.ac.in/index.php?r=site%2Fdiploma-syllabus-courses&prog=CT',
            'CT',
            Icons.computer,
          ),
          _buildBox(
             Color.fromARGB(255, 62, 212, 67),
            'https://sitttrkerala.ac.in/index.php?r=site%2Fdiploma-syllabus-courses&prog=CM',
            'CHE',
            Icons.engineering,
          ),
          _buildBox(
            Color.fromARGB(255, 235, 146, 175),
            'https://sitttrkerala.ac.in/index.php?r=site%2Fdiploma-syllabus-courses&prog=EL',
            'EL',
            Icons.lightbulb,
          ),
          _buildBox(
            Color.fromARGB(255, 24, 177, 228),
            'https://sitttrkerala.ac.in/index.php?r=site%2Fdiploma-syllabus-courses&prog=ME',
            'MECH',
            Icons.build,
          ),
          _buildBox(
            Color.fromARGB(255, 237, 144, 4),
            'https://sitttrkerala.ac.in/index.php?r=site%2Fdiploma-syllabus-courses&prog=CE',
            'CIVIL',
            Icons.apartment,
          ),
        ],
      ),
    );
  }

  Widget _buildBox(Color color, String url, String name, IconData iconData) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20), // Set border radius here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

