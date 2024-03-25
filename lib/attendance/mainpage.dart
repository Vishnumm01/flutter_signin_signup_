import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'makepdf.dart';

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
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

  var temp = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where(
          'div',
          isEqualTo: ww,
        )
        .snapshots();

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'Your App Title',
      theme: ThemeData(
        // Define your theme here
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => reportt(
                    list: temp,
                    clas: ww,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.send,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Attendance Page',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.blue[900],
                  isDense: true,
                  isExpanded: false,
                  iconEnabledColor: Colors.white,
                  focusColor: Colors.white,
                  items: options.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: const TextStyle(
                          color: Colors.white,
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
                const SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.blue[900],
                  isDense: true,
                  isExpanded: false,
                  iconEnabledColor: Colors.white,
                  focusColor: Colors.white,
                  items: options1.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: const TextStyle(
                          color: Colors.white,
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
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
          body: StreamBuilder(
            stream: _usersStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("something is wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (temp.contains(snapshot.data!.docChanges[index].doc['name'])) {
                            temp.remove(snapshot.data!.docChanges[index].doc['name']);
                          } else {
                            temp.add(snapshot.data!.docChanges[index].doc['name']);
                          }
                        });
                        print(temp);
                        setState(() {});
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(snapshot.data!.docChanges[index].doc['name']),
                          trailing: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: temp.contains(snapshot.data!.docChanges[index].doc['name'])
                                  ? const Color.fromARGB(255, 248, 20, 4)
                                  : const Color.fromARGB(255, 0, 228, 8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                temp.contains(snapshot.data!.docChanges[index].doc['name']) ? 'Remove' : 'add',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
