import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/CourseListWidget.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Scene8 extends StatelessWidget {
  final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .ref("suggestedTrainings");
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xffb1ccac),
          elevation: 0,
          type: BottomNavigationBarType.fixed, // Set the type to fixed

          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            }

            if (index == 1) {
              Navigator.of(context).pop();
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/vector-qTX.png',
                width: 30,
                height: 30,
                color: Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/vector-Vc5.png',
                width: 30,
                height: 30,
                color: Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Back',
            ),
          ],
          selectedItemColor: Color.fromRGBO(77, 119, 34, 1),
          unselectedItemColor: Color.fromRGBO(77, 119, 34, 1),
        ),
      ),
      body: SingleChildScrollView(
       child: Container(
       width: double.infinity,
        child: Container(
        // officerstrainingpb3 (309:1264)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupqxprwvZ (Lu2U5jbzptiCBD3f3oQxpR)
              padding: EdgeInsets.fromLTRB(0*fem, 44*fem, 0*fem, 25*fem),
              width: double.infinity,
              height: 435*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/rectangle-389-bg-frh.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // D7P (309:1266)
                    margin: EdgeInsets.fromLTRB(20*fem, 290*fem, 79*fem, 0*fem),
                    constraints: BoxConstraints (
                      maxWidth: 250*fem,
                    ),
                    child: Text(
                      'ഉദ്യോഗസ്ഥ പരിശീലനം',
                      style: safeGoogleFont (
                        'Inter',
                        fontSize: 28*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2125*ffem/fem,
                        color: Color(0xffddd7d7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupyeftjE9 (Lu2UcUDnYDj67YrYhaYEfT)
              padding: EdgeInsets.fromLTRB(11*fem, 26*fem, 7*fem, 24*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the button press here
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Define a TextEditingController for the text field
                          TextEditingController textEditingController = TextEditingController();

                          return AlertDialog(
                            title: Text("പരിശീലനം നിർദ്ദേശിക്കുക"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("നിർദ്ദേശിക്കുന്ന പരിശീലനം നൽകുക:"),
                                SizedBox(height: 10),
                                TextField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    hintText: "ഇവിടെ ടൈപ്പ് ചെയ്യു...",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async{
                                  // Handle the submit action here
                                  String suggestedTraining = textEditingController.text;
                                  String ChosenCategory = 'ഉദ്യോഗസ്ഥ പരിശീലനം';
                                  await dbRef.push().set({
                                    'chosenCategory': ChosenCategory,
                                    'suggestedTraining': suggestedTraining,
                                  });

                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text("സമർപ്പിക്കുക"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 60 * fem, 24 * fem),
                      padding: EdgeInsets.fromLTRB(13 * fem, 8.5 * fem, 10 * fem, 8.5 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x7c89a984),
                        borderRadius: BorderRadius.circular(20 * fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0 * fem, 4 * fem),
                            blurRadius: 2 * fem,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 0 * fem),
                            child: Text(
                              'മറ്റ് പരിശീലനങ്ങൾ ചേർക്കുക ',
                              style: safeGoogleFont(
                                'Inter',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            width: 21 * fem,
                            height: 19 * fem,
                            child: Image.asset(
                              'assets/vector-C8H.png',
                              width: 21 * fem,
                              height: 19 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    // availabletrainingsAim (309:1276)
                    'പരിശീലനങ്ങൾ:',
                    style: safeGoogleFont (
                      'Inter',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            CourseListWidget('Officer Training')
          ],
        ),
      ),
    ),
    ),
    );
  }
}