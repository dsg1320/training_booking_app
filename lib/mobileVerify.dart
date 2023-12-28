import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/otp.dart';
import 'package:training_booking_app/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:training_booking_app/bookingstore.dart';

class phnNum extends StatefulWidget {
  final BookingDetails bookingDetails;
  static String verify = "";
  phnNum({Key? key, required this.bookingDetails}) : super(key: key);
  @override
  State<phnNum> createState() => _phnNumState();
}

class _phnNumState extends State<phnNum> {
  //final phnController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  var phone = "";

  late DatabaseReference dbRef;

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
//dbRef = FirebaseDatabase.instance.ref().child('Booking');
    dbRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .ref("verification");
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // otppageWhX (83:2768)
            padding: EdgeInsets.fromLTRB(
                22.92 * fem, 128.21 * fem, 24 * fem, 65 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffa8e4a0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // 2fs (83:2836)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 28.92 * fem, 51.79 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 298 * fem,
                  ),
                  child: Text(
                    'ഫോൺ നമ്പർ വെരിഫൈ ചെയ്യുക  ',
                    style: safeGoogleFont(
                      'Inter',
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff182035),
                    ),
                  ),
                ),
                Container(
                  // frame3546vd (83:2823)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 82 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // phonenodvZ (83:2831)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 4 * fem),
                        width: double.infinity,
                        child: Text(
                          'Enter mobile no.*',
                          textAlign: TextAlign.center,
                          style: safeGoogleFont(
                            'Inter',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff737373),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupyuz5Z3X (5CSKGTGKkGzNZdVUytyUZ5)
                        margin: EdgeInsets.fromLTRB(
                            0.08 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        height: 48 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group19spu (83:2826)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 8.11 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  8.34 * fem, 14 * fem, 6.5 * fem, 14 * fem),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffd9d9d9)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(7 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // 9XX (83:2828)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 9.16 * fem, 0 * fem),
                                    child: Text(
                                      '+91',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff252525),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   // phcaretdownfill4Pb (83:2829)
                                  //   width: 20*fem,
                                  //   height: 20*fem,
                                  //   child: Image.asset(
                                  //     'assets/page-1/images/ph-caret-down-fill.png',
                                  //     width: 20*fem,
                                  //     height: 20*fem,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              // group18asj (83:2824)
                              width: 237.89 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7 * fem),
                              ),
                              child: Center(
                                // rectangle12jVj (83:2825)
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 48 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(7 * fem),
                                      border:
                                          Border.all(color: Color(0xffd9d9d9)),
                                      color: Color(0xffffffff),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          phone = value;
                                        },
                                        maxLength:
                                            10, // Allow exactly 10 characters
                                        decoration: InputDecoration(
                                          counterText:
                                              '', // Hide character count
                                          hintText: 'Phone Number',
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 15 * fem,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff252525),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // wehavesendyouanonetimepassword (83:2837)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 2.92 * fem, 251 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 319 * fem,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: safeGoogleFont(
                        'Inter',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        color: Color(0xff606268),
                      ),
                      children: [
                        TextSpan(
                          text: 'We have send you an ',
                        ),
                        TextSpan(
                          text: 'One Time Password(OTP)\n',
                          style: safeGoogleFont(
                            'Inter',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff313646),
                          ),
                        ),
                        TextSpan(
                          text: 'on this mobile number.',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.fromLTRB(0.08*fem, 0*fem, 0*fem, 0*fem),                    //SUBMIT BUTTON
                  width: 328 * fem,
                  height: 48 * fem,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countryController.text + phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            phnNum.verify = verificationId;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyVerify(
                                        bookingDetails:
                                            widget.bookingDetails)));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                        SnackBar(
                          content: Text('OTP has been sent'),
                        );
                      } catch (e) {
                        print(e.toString());
                        // Show failure message using SnackBar
                        SnackBar(
                          content: Text('Failed to sent an OTP'),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF243836),
                      //height: 1.2125 * ffem / fem,
                    ),
                    child: Center(
                      child: Text(
                        'Get Code',
                        textAlign: TextAlign.center,
                        style: safeGoogleFont(
                          'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2125 * ffem / fem,
                          letterSpacing: 0.32 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
