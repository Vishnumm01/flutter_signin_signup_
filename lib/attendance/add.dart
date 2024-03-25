import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController name = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController rolln = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var ww = 'CTS6';
  var options = [
    'CE',
    'CHE',
    'CT',
    'EL',
    'ME',
  ];
  var _currentItemSelected = "CT";
  var rool = "CT";

  var options1 = [
    'S2',
    'S4',
    'S6',
  ];
  var _currentItemSelected1 = "S6";
  var rool1 = "S6";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Add a student'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: rolln,
                decoration: const InputDecoration(
                  hintText: 'Roll Number',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text('Class : '),
                    DropdownButton<String>(
                      dropdownColor: const Color.fromARGB(255, 0, 255, 21),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: const Color.fromARGB(255, 1, 1, 255),
                      focusColor: const Color.fromARGB(255, 0, 17, 251),
                      items: options.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 11, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          _currentItemSelected = newValueSelected!;
                          rool = newValueSelected;

                          ww = '';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                Row(
                  children: [
                    const Text('Div : '),
                    DropdownButton<String>(
                      dropdownColor: const Color.fromARGB(255, 26, 255, 0),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                      items: options1.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected1) {
                        setState(() {
                          _currentItemSelected1 = newValueSelected1!;
                          rool1 = newValueSelected1;
                          ww = '';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected1,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 2, 11, 128),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                ref.add({
                  'name': name.text,
                  'div': ww,
                  'roll': rolln.text,
                }).whenComplete(() {
                  Fluttertoast.showToast(
                    msg: "added",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                });
              },
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
