// ignore_for_file: use_super_parameters

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin/menu.dart';
import 'package:signin/reusable_widgets/reusable_widget.dart';
import 'package:signin/screens/reset_password.dart';
import 'package:signin/screens/signup_screen.dart';
import 'package:signin/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool _obscureText = false; // Moved the _obscureText variable here

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Container(
      
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.greenAccent,
            
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'GPTC CHELAKKARA',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
                items: [
                  'assets/COLLEGE.jpg',
                  'assets/GPTC MM.png',
                  'assets/COLLEGE2.png',
                  'assets/COLLEGE3.png',
                  // Add more image paths as needed
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 800,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image.asset(
                          item.toString(),
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 15,),
              Padding(
              padding: const EdgeInsets.all(10.0),
              child:TextField(
                controller: _emailTextController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                 // fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                  
                ),
              ),
            
              ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
              child:TextField(
  obscureText: _obscureText,
  controller: _passwordTextController,
  decoration: InputDecoration(
    hintText: 'Password',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(80),
    ),
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
        color: _obscureText ? Colors.grey : const Color.fromARGB(255, 152, 151, 151),
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    ),
    //fillColor: Colors.white, // Add this line to set the background color
    filled: true, // Set to true to fill the background with the fillColor
  ),
),
              ),

              const SizedBox(
                height: 5,
              ),
              
              forgetPassword(context),
              firebaseUIButton(context, "Sign In", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                )
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menuscreen()),
                  );
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Color.fromARGB(179, 52, 64, 234)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Color.fromARGB(255, 13, 48, 163), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResetPassword()),
        ),
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Color.fromARGB(179, 52, 64, 234)),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
