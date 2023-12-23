import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/categories.dart';
import 'package:training_booking_app/institution_sendmail.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Scene3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xffb1ccac),
          elevation: 0,
          type: BottomNavigationBarType.fixed, // Set the type to fixed

          onTap: (index) {
            if (index == 0) {
              logout(context);
            }
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            }

            if (index == 2) {
              Navigator.of(context).pop();
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: 'Logout',
            ),
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
        // institutionsDhj (218:1206)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupj2ktZmb (Lu2B7yNCB2NVR3LgSGj2KT)
              width: double.infinity,
              height: 344*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(29*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/rectangle-388-bg-qPF.png',
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(20*fem, 250*fem, 79*fem, 0*fem),
                  constraints: BoxConstraints (
                      maxWidth: 150*fem
                  ),
                  child: Text(
                    'Welcome',
                    style: safeGoogleFont (
                      'Proza Libre',
                      fontSize: 36*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.365*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                )

            ),
            Container(
              // autogroupa4mwbiH (Lu2BNoGpght12Xbkm8A4mw)
              padding: EdgeInsets.fromLTRB(24*fem, 57.24*fem, 23*fem, 68*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupybtfvVf (Lu2BByFXo3uFtriLkPYBTF)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 43*fem),
                    width: double.infinity,
                    height: 116*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle2dus (218:1209)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 35*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(16.5*fem, 23*fem, 18.5*fem, 17*fem),
                          width: 139*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0x7c89a984),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Scene1()));
                              },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  // addparticipantusP (I218:1209;21:25)
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                    constraints: BoxConstraints (
                                      maxWidth: 104*fem,
                                    ),
                                    child: Text(
                                      'Add participant',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // vector1vR (218:1212)
                                  width: 21*fem,
                                  height: 19*fem,
                                  child: Image.asset(
                                    'assets/vector-ji1.png',
                                    width: 21*fem,
                                    height: 19*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // rectangle389ZBF (218:1213)
                          padding: EdgeInsets.fromLTRB(11*fem, 23*fem, 13*fem, 10*fem),
                          width: 139*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0x7c89a984),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Scene4()));
                              },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  // sendmailF45 (I218:1213;21:25)
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                    constraints: BoxConstraints (
                                      maxWidth: 115*fem,
                                    ),
                                    child: Text(
                                      'Send e-mail/SMS',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // vector87s (218:1217)
                                  margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                  width: 31*fem,
                                  height: 26*fem,
                                  child: Image.asset(
                                    'assets/vector-TQ5.png',
                                    width: 31*fem,
                                    height: 26*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // rectangle3903kd (218:1218)
                    margin: EdgeInsets.fromLTRB(87*fem, 0*fem, 87*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(9*fem, 35*fem, 11*fem, 15*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0x7c89a984),
                      borderRadius: BorderRadius.circular(10*fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                                
                              },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            // addparticipant8GH (I218:1218;21:25)
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                              child: Text(
                                'View Details',
                                textAlign: TextAlign.center,
                                style: safeGoogleFont (
                                  'Inter',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // vectorEKK (218:1221)
                            margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                            width: 24*fem,
                            height: 31*fem,
                            child: Image.asset(
                              'assets/vector-CW5.png',
                              width: 24*fem,
                              height: 31*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    ),
    );
  }
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Loginpage(),
      ),
    );
  }
}