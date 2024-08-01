import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/CourseListWidget.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Scene2 extends StatelessWidget {
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
    TextEditingController instituteController = TextEditingController();
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
        // awarenessLK3 (309:1282)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup565p4F3 (Lu2VBCnF4ZWNHoMGWR565P)
              padding: EdgeInsets.fromLTRB(18*fem, 46*fem, 22*fem, 16*fem),
              width: double.infinity,
              height: 435*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/rectangle-389-bg-Jsj.png',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // 4Xs (309:1284)
                    margin: EdgeInsets.fromLTRB(4*fem, 250*fem, 41*fem, 0*fem),
                    constraints: BoxConstraints (
                      maxWidth: 279*fem,
                    ),
                    child: Text(
                      'പൊതു ജനങ്ങൾക്കുള്ള ബോധവത്കരണം',
                      style: safeGoogleFont (
                        'Inter',
                        fontSize: 28*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2125*ffem/fem,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupra2vjP7 (Lu2W1vt451QiPKLdZira2V)
              padding: EdgeInsets.fromLTRB(18*fem, 35*fem, 18*fem, 24.5*fem),
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
                                  controller: instituteController,
                                  decoration: InputDecoration(
                                    hintText: "സ്ഥലപ്പേര് നൽകുക...",
                                  ),
                                ),
                                SizedBox(height:10),
                                TextField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    hintText: "പരിശീലനത്തിൻ്റെ പേര് നൽകുക...",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async{
                                  // Handle the submit action here
                                  String suggestedTraining = textEditingController.text;
                                  String ChosenCategory = 'പൊതു ജനങ്ങൾക്കുള്ള ബോധവത്കരണം';
                                  await dbRef.push().set({
                                    'chosenCategory': ChosenCategory,
                                    'suggestedTraining': suggestedTraining,
                                    'Institute': instituteController.text,
                                  });
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text("Submit"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 60 * fem, 24.5 * fem),
                      padding: EdgeInsets.fromLTRB(13 * fem, 8.5 * fem, 4 * fem, 8.5 * fem),
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
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
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
                    // availablePMB (309:1291)
                    'പരിശീലനങ്ങൾ: ',
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
            CourseListWidget('Awareness Programme')
          ],
        ),
      ),
    ),
    ),
    );
  }
}