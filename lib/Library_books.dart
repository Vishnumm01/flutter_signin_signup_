import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package for launching URLs

class Librarybooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTES'),
        backgroundColor: Colors.blue,
      
      ),

      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildBox(
            Color.fromARGB(255, 8, 69, 120),
            'CT',
            Icons.computer,
            context,
            [
              _buildInnerBox(
                'https://web.stanford.edu/class/cs106e/lectureNotes/L23NAIMachineLearning.pdf',
                'Ai & MachineLearning',
                'https://cdn-icons-png.flaticon.com/512/9390/9390645.png',
              ),
              _buildInnerBox(
                'https://www.webpages.uidaho.edu/~stevel/504/Python%20Notes.pdf',
                'Python',
                'https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/community/logos/python-logo-only.png',
              ),
              _buildInnerBox(
                'https://cse.iitkgp.ac.in/~pallab/PDS-2011-SPRING/Lec-1c.pdf',
                'C Programming',
                'https://cdn-icons-png.flaticon.com/512/103/103075.png',
              ),
              _buildInnerBox(
                'https://staff.um.edu.mt/__data/assets/pdf_file/0010/57169/jn.pdf',
                'Java',
                'https://cdn-icons-png.flaticon.com/512/152/152760.png'
              ),
              _buildInnerBox(
                'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
                'flutter-dart',
                'https://toppng.com/uploads/preview/phone-icon-blue-mobile-icon-11553392717a4g7h3wf6a.png'
              ),
            ],
          ),
          _buildBox(
            Color.fromARGB(255, 62, 212, 67),
            'CHE',
            Icons.engineering,
            context,
            [
              _buildInnerBox(
                'https://www.protoshop.in/wp-content/uploads/2019/12/Hardware-tools2.pdf',
                'hardware tools',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVezZI1c6_0Y3Kwcg9slyoSP-e2GGtyg1K9A&usqp=CAU'
              ),
              _buildInnerBox(
                'https://portal.abuad.edu.ng/lecturer/documents/1586344071Computer_Hardware_Fundamentals.pdf',
                'inputs/outputs',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVezZI1c6_0Y3Kwcg9slyoSP-e2GGtyg1K9A&usqp=CAU'
              ),
            ],
          ),
          _buildBox(
            Color.fromARGB(255, 235, 146, 175),
            'EL',
            Icons.lightbulb,
            context,
            [
              _buildInnerBox(
                'https://physicaeducator.files.wordpress.com/2018/03/principles-of-electronic-communication-system-by-luies.pdf',
                'Electronic Communication',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPtS3an480gFXAUhVr8QEpmPV6FvYW0Xg-ZA&usqp=CAU'
              ),
              _buildInnerBox(
                'https://www.vssut.ac.in/lecture_notes/lecture1429540825.pdf',
                'Microwave engineering',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnwWNy2IWvecPHVXvVRgjdcd0G4fIzTG5kSg&usqp=CAU'
              ),
            ],
          ),
          _buildBox(
            Color.fromARGB(255, 67, 233, 219),
            'MECH',
            Icons.build,
            context,
            [
              _buildInnerBox(
                'https://eeedocs.files.wordpress.com/2014/02/machinedrawing.pdf',
                'Machine Drawing',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDCLJ44q8VWTJgNR8y2h9RhXtlhpwweBMbuw&usqp=CAU'
              ),
              _buildInnerBox(
                'https://www.academia.edu/39536389/Thermal_Engineering_By_R_K_Rajput_8_Ed',
                'Thermal engineering',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo_EeqwB6n_heZqLYXSww2mzIv27qHKB8uIg&usqp=CAU'
              ),
            ],
          ),
          _buildBox(
            Color.fromARGB(255, 237, 144, 4),
            'CIVIL',
            Icons.apartment,
            context,
            [
              _buildInnerBox(
                'https://books.google.co.in/books?id=V0MjEAAAQBAJ&printsec=copyright&redir_esc=y#v=onepage&q&f=false',
                'CAD/CAM',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLNKMF9q88N5zP3awljbVOsHaEx4jlSAi0aQ&usqp=CAU'
              ),
              _buildInnerBox(
                'https://books.google.co.in/books/about/Concrete_Technology_Theory_and_Practice.html?id=4O3sDwAAQBAJ&redir_esc=y',
                'Concrete Technology',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjIUCRD7VV8tJdrEgsacZUqdl_ybb8Ml6_og&usqp=CAU'
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox(Color color, String name, IconData iconData, BuildContext context, List<Widget> innerBoxes) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context, innerBoxes);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
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

  Widget _buildInnerBox(String url, String name, String iconUrl) {
  return GestureDetector(
    onTap: () {
      launch(url);
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            iconUrl,
            width: 40, // Set the width of the image
            height: 40, // Set the height of the image
            color: Colors.white, // Optional: apply color to the image
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}


  void _showBottomSheet(BuildContext context, List<Widget> innerBoxes) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a Book',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  children: innerBoxes,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
