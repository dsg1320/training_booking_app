import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/utils.dart';
import 'package:training_booking_app/bookingstore.dart';

import 'main.dart';
import 'mobileVerify.dart';

class Booking extends StatefulWidget {
  final String category;
  final String course;

  Booking({required this.category, required this.course});
  @override
  State<Booking> createState() => _BookingState();
}

 bool isAdditionalFieldRequired(String category, String course) {
  return (category == 'Farmers Training' && course == 'പശു പരിപാലനം') ||
         (category == 'Farmers Training' && course == 'ആട് വളർത്തൽ');
}

class _BookingState extends State<Booking> {
  String dropdownValue = 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക';
  String dropdownValue1 = 'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final mailController = TextEditingController();
  final addressController = TextEditingController();
  final instituteController = TextEditingController();
  final BookingDetails bookingDetails = BookingDetails();

  late DatabaseReference dbRef;

  bool showAdditionalField = false;

  @override
  void initState() {
    super.initState();
//dbRef = FirebaseDatabase.instance.ref().child('Booking');
    dbRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .ref("Booking");
  }

 


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // bookingpageYiu (68:20)
            padding:
                EdgeInsets.fromLTRB(16 * fem, 110.5 * fem, 16 * fem, 54 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffa8e4a0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // 3vZ (72:35)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 147 * fem, 70.5 * fem),
                  child: Text(
                    'ബുക്കിംഗ്',
                    style: safeGoogleFont(
                      'Inter',
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff243836),
                    ),
                  ),
                ),
                Container(
                  // frame59Cu (77:1217)
                  margin:
                      EdgeInsets.fromLTRB(7 * fem, 0 * fem, 0 * fem, 21 * fem),
                  width: 317 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                nameController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'പേര് ', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        height: 44 * fem,
                        child: Center(
                          child: TextField(
                            controller: ageController,
                            maxLength: 3,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'വയസ്സ്', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                           // keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller: genderController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ജൻഡർ', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                mailController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ഇ-മെയിൽ', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                addressController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'വിലാസം', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: // State variable to hold selected value

                              DropdownButtonFormField<String>(
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select an institution';
                              }
                              return null; // Return null if the value is valid
                            },
                            items: [
                              DropdownMenuItem(
                                value: 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക',
                                child: Text(
                                  'സ്ഥാപനം തിരഞ്ഞെടുക്കുക',
                                  style: TextStyle(
                                    color: Colors
                                        .grey, // Set the hint text color to grey
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC കുടപ്പനക്കുന്ന്,തിരുവനന്തപുരം',
                                child: Text(
                                  'LMTC കുടപ്പനക്കുന്ന്,തിരുവനന്തപുരം',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC കുടപ്പനക്കുന്ന്,തിരുവനന്തപുരം'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC കൊട്ടിയം, കൊല്ലം',
                                child: Text(
                                  'LMTC കൊട്ടിയം, കൊല്ലം',
                                  style: TextStyle(
                                    color:
                                        dropdownValue == 'LMTC കൊട്ടിയം, കൊല്ലം'
                                            ? Colors.black
                                            : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC തലയോലപ്പറമ്പ്,കോട്ടയം',
                                child: Text(
                                  'LMTC തലയോലപ്പറമ്പ്,കോട്ടയം',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC തലയോലപ്പറമ്പ്,കോട്ടയം'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC വാഗമൺ, ഇടുക്കി',
                                child: Text(
                                  'LMTC വാഗമൺ, ഇടുക്കി',
                                  style: TextStyle(
                                    color:
                                        dropdownValue == 'LMTC വാഗമൺ, ഇടുക്കി'
                                            ? Colors.black
                                            : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC ആലുവ എറണാകുളം',
                                child: Text(
                                  'LMTC ആലുവ എറണാകുളം',
                                  style: TextStyle(
                                    color: dropdownValue == 'LMTC ആലുവ എറണാകുളം'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC മലമ്പുഴ, പാലക്കാട്',
                                child: Text(
                                  'LMTC മലമ്പുഴ, പാലക്കാട്',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC മലമ്പുഴ, പാലക്കാട്'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC ആദവനാട്, മലപ്പുറം',
                                child: Text(
                                  'LMTC ആദവനാട്, മലപ്പുറം',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC ആദവനാട്, മലപ്പുറം'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC മുണ്ടയാട്, കണ്ണൂർ',
                                child: Text(
                                  'LMTC മുണ്ടയാട്, കണ്ണൂർ',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC മുണ്ടയാട്, കണ്ണൂർ'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'LMTC സുൽത്താൻബത്തേരി, വയനാട്',
                                child: Text(
                                  'LMTC സുൽത്താൻബത്തേരി, വയനാട്',
                                  style: TextStyle(
                                    color: dropdownValue ==
                                            'LMTC സുൽത്താൻബത്തേരി, വയനാട്'
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                              // Add other DropdownMenuItem widgets for remaining institutions
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              //hintText: 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: dropdownValue != null
                                  ? Colors.black
                                  : Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                       if (isAdditionalFieldRequired(widget.category, widget.course))
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    if (widget.course == 'Cow management')
                       DropdownButtonFormField<String>(
                        value: dropdownValue1,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: [
                           DropdownMenuItem(
                            value: '',
                            child: Text('എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?',
                            style: TextStyle(
                                    color: dropdownValue1 ==
                                            'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?'
                                        ? Colors.grey
                                        : null,
                                  ),),
                          ),
                          DropdownMenuItem(
                            value: '0',
                            child: Text('0',style: TextStyle(
                                    color: dropdownValue1 ==
                                            '0'
                                        ? Colors.black
                                        : null,
                                  ),),
                          ),
                          DropdownMenuItem(
                            value: '1-5',
                            child: Text('1-5'),
                          ),
                          DropdownMenuItem(
                            value: '5-10',
                            child: Text('5-10',
                            style: TextStyle(
                                    color: dropdownValue1 ==
                                            '5-10'
                                        ? Colors.black
                                        : null,
                                  ),),
                          ),
                          DropdownMenuItem(
                            value: '10-15',
                            child: Text('10-15',
                            style: TextStyle(
                                    color: dropdownValue1 ==
                                            '10-15'
                                        ? Colors.black
                                        : null,
                                  ),),
                          ),
                          DropdownMenuItem(
                            value: '15-ലും കൂടുതൽ',
                            child: Text('15-ലും കൂടുതൽ',
                            style: TextStyle(
                                    color: dropdownValue1 ==
                                            '15-ലും കൂടുതൽ'
                                        ? Colors.black
                                        : null,
                                  ),),
                          ),
                          // Add other DropdownMenuItem widgets
                        ],
                        decoration: InputDecoration(
                          //labelText: 'Field A',
                          border: OutlineInputBorder(),
                        ),),
                    // if (widget.course == 'ആട് വളർത്തൽ')
                    //   TextField(
                    //     // Additional field specific to Hen Breeding
                    //     // ...
                    //     decoration: InputDecoration(labelText: 'Field B'),
                    //   ),
                  ],
                ),
              ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30 * fem,
                ),
                Container(
                  width: double.infinity,
                  height: 40 * fem,
                  child: ElevatedButton(
                    onPressed: () {
                      DateTime currentDate = DateTime.now();
                      String formattedDate =
                          '${currentDate.year}-${currentDate.month}-${currentDate.day}';
                      BookingDetails bookingDetails = BookingDetails();
                      bookingDetails.name = nameController.text;
                      bookingDetails.age = ageController.text;
                      bookingDetails.gender = genderController.text;
                      bookingDetails.email = mailController.text;
                      bookingDetails.address = addressController.text;
                      bookingDetails.institute = instituteController.text;
                      bookingDetails.category = widget.category;
                      bookingDetails.course = widget.course;
                      bookingDetails.date = formattedDate;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                phnNum(bookingDetails: bookingDetails)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF243836), alignment: Alignment.center
                        //height: 1.2125 * ffem / fem,
                        ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'അടുത്തത്\n\n',
                          //textAlign: TextAlign.end,
                          style: safeGoogleFont(
                            'Montserrat',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2175 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //);
  }
}
