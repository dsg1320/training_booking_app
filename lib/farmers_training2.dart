import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';
import 'package:training_booking/CourseListWidget.dart';
import 'package:training_booking/applyWidget.dart';

class farmersTraining2 extends StatefulWidget {
  @override
  _farmersTraining2 createState() => _farmersTraining2();
}
class _farmersTraining2 extends State<farmersTraining2> {
  final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .ref("suggestedTrainings");
  TextEditingController textEditingController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  String? selectedInstitute;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xffb1ccac),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          // Set the type to fixed

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
          padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 40 * fem),
          decoration: BoxDecoration(
            color: Color(0xffb1ccac),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    0 * fem, 0 * fem, 0 * fem, 60.5 * fem),
                padding: EdgeInsets.fromLTRB(
                    14 * fem, 40 * fem, 16 * fem, 29 * fem),
                width: double.infinity,
                height: 467 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20 * fem),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image2.jpeg'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                // child: TextButton(
                //   onPressed: () {
                //     // Your navigation or other interaction
                //   },
                //   style: TextButton.styleFrom(padding: EdgeInsets.zero),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Container(
                //       width: double.infinity,
                //       height: 40 * fem,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20 * fem),
                //         color: Color(0x5835703b),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'Apply!',
                //           textAlign: TextAlign.center,
                //           style: GoogleFonts.inter(
                //             fontSize: 14 * ffem,
                //             fontWeight: FontWeight.w400,
                //             color: Color(0xff000000),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(
                    10 * fem, 0 * fem, 20 * fem, 7.5 * fem),
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
                              title: Text("പരിശീലനങ്ങൾ നിർദ്ദേശിക്കുക"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("നിർദ്ദേശിച്ച പരിശീലനം നൽകുക:"),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: selectedInstitute,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedInstitute = newValue!;
                                      });
                                    },
                                    hint: Text("സ്ഥലം തിരഞ്ഞെടുക്കുക"),
                                    items: [
                                      "കുടപ്പനക്കുന്ന്",
                                      "കൊട്ടിയം",
                                      "തലയോലപ്പറമ്പ്",
                                      "വാഗമൺ",
                                      "ആലുവ",
                                      "മലമ്പുഴ",
                                      "ആദവനാട്",
                                      "മുണ്ടയാട്",
                                      "സുൽത്താൻബത്തേരി",
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      hintText: "പരിശീലനത്തിൻ്റെ പേര് നൽകുക",
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    // Handle the submit action here
                                    String suggestedTraining = textEditingController
                                        .text;
                                    String ChosenCategory = 'കർഷക പരിശീലനം';
                                    await dbRef.push().set({
                                      'chosenCategory': ChosenCategory,
                                      'suggestedTraining': suggestedTraining,
                                      'Institute': instituteController.text,
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
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 60 * fem, 24.5 * fem),
                        padding: EdgeInsets.fromLTRB(
                            13 * fem, 8.5 * fem, 10 * fem, 8.5 * fem),
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
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 3 * fem, 0 * fem),
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
                      'പരിശീലനങ്ങൾ :',
                      style: GoogleFonts.inter(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              applyWidget('Farmers Training')
            ],
          ),
        ),
      ),
    );
  }
}
