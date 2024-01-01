import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/Admin/courseadd.dart';
import 'package:training_booking_app/categories.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_booking_app/Admin/ViewDetails.dart';
import 'package:training_booking_app/register.dart';


class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 355;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(

      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xfff1eaea),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPage(),
                  ));
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
                'assets/vector-CW5.png',
                width: 30,
                height: 30,
                color: Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Details',
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
        // adminspageo13 (100:1527)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff1eaea),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              // autogroup4rzdv5f (5CSKdCAmQYBMJRsDrP4rZd)
              // padding: EdgeInsets.fromLTRB(165.99*fem, 240.66*fem, 119.56*fem, 181.1*fem),
              // width: double.infinity,
              height: 350.76*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(29*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,

                  image: AssetImage (
                    'assets/rectangle-388-bg.png',

                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // vector8Bj (103:1564)
                    margin: EdgeInsets.fromLTRB(295*fem, 0*fem, 0*fem, 65.56*fem),

                  ),
                  Container(
                    // welcomeQ9F (103:1554)
                    margin: EdgeInsets.fromLTRB(0*fem, 60*fem, 21*fem, 0*fem),
                    child: Text(
                      'Welcome',
                      style: safeGoogleFont (
                        'Inria Serif',
                        fontSize: 60*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1975*ffem/fem,
                        letterSpacing: 1.28*fem,
                        color: Color(0xffffffff),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(

              // autogroupkbbuVwP (5CSKjwUXPi1eMsS9dTKBbu)
              padding: EdgeInsets.fromLTRB(8*fem, 65.9*fem, 8*fem, 17*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(


                    // group758992wK (223:1344)
                    margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 0*fem, 170*fem),
                    width: double.infinity,
                    height: 126*fem,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(

                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Container(

                              // autogroup3sgwX9K (5CSKymQpVt8xrQMJsn3SGw)
                              padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 20*fem),
                              width: 137*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xfffbf9f9),
                                borderRadius: BorderRadius.circular(10*fem),

                              ),
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseFormScreen()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // vectorrau (103:1561)
                                      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 14*fem),
                                      width: 40*fem,
                                      height: 15*fem,
                                      child: Image.asset(
                                        'assets/vector-C8H.png',
                                        width: 45*fem,
                                        height: 43*fem,
                                      ),
                                    ),
                                    Text(
                                      // seedetailszBK (103:1563)
                                      'Add courses',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont (
                                        'Istok Web',
                                        fontSize: 19*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.44*ffem/fem,
                                        letterSpacing: 0.4*fem,
                                        color: Color(0xff73c268),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 23.0,
                            ),
                            Container(
                              // autogroup3sgwX9K (5CSKymQpVt8xrQMJsn3SGw)
                              padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 20*fem),
                              width: 137*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xfffbf9f9),
                                borderRadius: BorderRadius.circular(10*fem),


                              ),
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // vectorrau (103:1561)
                                      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 14*fem),
                                      width: 40*fem,
                                      height: 15*fem,
                                      child: Image.asset(
                                        'assets/register.png',
                                        width: 32*fem,
                                        height: 43*fem,
                                      ),
                                    ),
                                    Text(
                                      // seedetailszBK (103:1563)
                                      'Register new institutions',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont (
                                        'Istok Web',
                                        fontSize: 14.7*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.84*ffem/fem,
                                        letterSpacing: 0.4*fem,
                                        color: Color(0xff73c268),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 23.0,
                            ),
                             Container(
                              // autogroup3sgwX9K (5CSKymQpVt8xrQMJsn3SGw)
                              padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 20*fem),
                              width: 137*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xfffbf9f9),
                                borderRadius: BorderRadius.circular(10*fem),


                              ),
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Scene1()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // vectorrau (103:1561)
                                      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 14*fem),
                                      width: 40*fem,
                                      height: 15*fem,
                                      child: Image.asset(
                                        'assets/vector-C8H.png',
                                        width: 45*fem,
                                        height: 43*fem,
                                      ),
                                    ),
                                    Text(
                                      // seedetailszBK (103:1563)
                                      'Add Participants',
                                      textAlign: TextAlign.center,
                                      style: safeGoogleFont (
                                        'Istok Web',
                                        fontSize: 17*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.44*ffem/fem,
                                        letterSpacing: 0.4*fem,
                                        color: Color(0xff73c268),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
          ),
    ),
    );
  }
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