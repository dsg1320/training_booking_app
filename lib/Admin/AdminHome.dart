import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/Admin/courseadd.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_booking_app/Admin/ViewDetails.dart';

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
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 25*fem,
                        height: 19.44*fem,
                        child: Image.asset(
                          'assets/vector-JVw.png',
                          width: 25*fem,
                          height: 19.44*fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // welcomeQ9F (103:1554)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
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
                    margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 10*fem, 170*fem),
                    width: double.infinity,
                    height: 126*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   // autogroupqh4tAGq (5CSKtbtkuRze4ok5e3Qh4T)
                        //    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                        //    padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 21*fem),
                        //    width: 146*fem,
                        //   height: double.infinity,
                        //   decoration: BoxDecoration (
                            
                        //     color: Color(0xfffffbfb),
                        //     borderRadius: BorderRadius.circular(10*fem),
                        //     boxShadow: [
                        //     //   BoxShadow(
                        //     //     color: Color(0x2473c268),
                        //     //     offset: Offset(0*fem, 0.0398648418*fem),
                        //     //     blurRadius: 0.7972968817*fem,
                        //     //   ),
                        //       BoxShadow(
                        //         color: Color(0x3073c268),
                        //         offset: Offset(0*fem, 0.0905760005*fem),
                        //         blurRadius: 1.8115199804*fem,
                        //       ),
                        //       BoxShadow(
                        //         color: Color(0x3873c268),
                        //         offset: Offset(0*fem, 0.1576435119*fem),
                        //         blurRadius: 3.1528701782*fem,
                        //       ),
                        //     //   BoxShadow(
                        //     //     color: Color(0x3d73c268),
                        //     //     offset: Offset(0*fem, 0.250431031*fem),
                        //     //     blurRadius: 5.008620739*fem,
                        //     //   ),
                        //     //   BoxShadow(
                        //     //     color: Color(0x4273c268),
                        //     //     offset: Offset(0*fem, 0.3863964975*fem),
                        //     //     blurRadius: 7.7279295921*fem,
                        //     //   ),
                        //     //   BoxShadow(
                        //     //     color: Color(0x4673c268),
                        //     //     offset: Offset(0*fem, 0.6029414535*fem),
                        //     //     blurRadius: 12.0588293076*fem,
                        //     //   ),
                        //     //   BoxShadow(
                        //     //     color: Color(0x4a73c268),
                        //     //     offset: Offset(0*fem, 1.0009765625*fem),
                        //     //     blurRadius: 20.01953125*fem,
                        //     //   ),
                        //       BoxShadow(
                        //         color: Color(0x5473c268),
                        //         offset: Offset(0*fem, 2*fem),
                        //         blurRadius: 40*fem,
                        //       ),
                        //     ],
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         // vector52R (103:1559)
                        //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 13*fem),
                        //         // width: 45*fem,
                        //         height: 43*fem,
                        //         child: Image.asset(
                        //           'assets/icons/plusIcon.png',
                        //           width: 45*fem,
                        //           height: 43*fem,
                        //         ),
                        //       ),
                        //       Text(
                        //         // addcoursesazm (103:1562)
                        //         'Add courses',
                        //         textAlign: TextAlign.center,
                        //         style: safeGoogleFont (
                        //           'Istok Web',
                        //           fontSize: 20*ffem,
                        //           fontWeight: FontWeight.w700,
                        //           height: 1.44*ffem/fem,
                        //           letterSpacing: 0.4*fem,
                        //           color: Color(0xff73c268),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          // autogroup3sgwX9K (5CSKymQpVt8xrQMJsn3SGw)
                          padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 20*fem),
                          width: 137*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfffbf9f9),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              // BoxShadow(
                              //   color: Color(0x2473c268),
                              //   offset: Offset(0*fem, 0.0398648418*fem),
                              //   blurRadius: 0.7972968817*fem,
                              // ),
                              BoxShadow(
                                color: Color(0x3073c268),
                                offset: Offset(0*fem, 0.0905760005*fem),
                                blurRadius: 1.8115199804*fem,
                              ),
                              BoxShadow(
                                color: Color(0x3873c268),
                                offset: Offset(0*fem, 0.1576435119*fem),
                                blurRadius: 3.1528701782*fem,
                              ),
                              // BoxShadow(
                              //   color: Color(0x3d73c268),
                              //   offset: Offset(0*fem, 0.250431031*fem),
                              //   blurRadius: 5.008620739*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4273c268),
                              //   offset: Offset(0*fem, 0.3863964975*fem),
                              //   blurRadius: 7.7279295921*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4673c268),
                              //   offset: Offset(0*fem, 0.6029414535*fem),
                              //   blurRadius: 12.0588293076*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4a73c268),
                              //   offset: Offset(0*fem, 1.0009765625*fem),
                              //   blurRadius: 20.01953125*fem,
                              // ),
                              BoxShadow(
                                color: Color(0x5473c268),
                                offset: Offset(0*fem, 2*fem),
                                blurRadius: 40*fem,
                              ),
                            ],
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
                          width: 43.0,
                        ),
                        Container(
                          // autogroup3sgwX9K (5CSKymQpVt8xrQMJsn3SGw)
                          padding: EdgeInsets.fromLTRB(12.5*fem, 20*fem, 12.5*fem, 20*fem),
                          width: 137*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfffbf9f9),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              // BoxShadow(
                              //   color: Color(0x2473c268),
                              //   offset: Offset(0*fem, 0.0398648418*fem),
                              //   blurRadius: 0.7972968817*fem,
                              // ),
                              BoxShadow(
                                color: Color(0x3073c268),
                                offset: Offset(0*fem, 0.0905760005*fem),
                                blurRadius: 1.8115199804*fem,
                              ),
                              BoxShadow(
                                color: Color(0x3873c268),
                                offset: Offset(0*fem, 0.1576435119*fem),
                                blurRadius: 3.1528701782*fem,
                              ),
                              // BoxShadow(
                              //   color: Color(0x3d73c268),
                              //   offset: Offset(0*fem, 0.250431031*fem),
                              //   blurRadius: 5.008620739*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4273c268),
                              //   offset: Offset(0*fem, 0.3863964975*fem),
                              //   blurRadius: 7.7279295921*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4673c268),
                              //   offset: Offset(0*fem, 0.6029414535*fem),
                              //   blurRadius: 12.0588293076*fem,
                              // ),
                              // BoxShadow(
                              //   color: Color(0x4a73c268),
                              //   offset: Offset(0*fem, 1.0009765625*fem),
                              //   blurRadius: 20.01953125*fem,
                              // ),
                              BoxShadow(
                                color: Color(0x5473c268),
                                offset: Offset(0*fem, 2*fem),
                                blurRadius: 40*fem,
                              ),
                            ],
                          ),
                          child:InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // vectorrau (103:1561)
                                  margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 14*fem),
                                  width: 32*fem,
                                  height: 15*fem,
                                  child: Image.asset(
                                    'assets/vector-CW5.png',
                                    width: 32*fem,
                                    height: 43*fem,
                                  ),
                                ),
                                Text(
                                  // seedetailszBK (103:1563)
                                  'See Details',
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
                      ],
                    ),
                  ),
                  // Container(
                  //   // group75901vKs (243:1969)
                  //   width: double.infinity,
                  //   height: 59*fem,
                  //   decoration: BoxDecoration (
                  //     borderRadius: BorderRadius.circular(25*fem),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color(0x3f000000),
                  //         offset: Offset(0*fem, 4*fem),
                  //         blurRadius: 2*fem,
                  //       ),
                  //       BoxShadow(
                  //         color: Color(0x3f000000),
                  //         offset: Offset(0*fem, 4*fem),
                  //         blurRadius: 2*fem,
                  //       ),
                  //     ],
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         // component1bwo (I243:1969;1:295)
                  //         // left: -8*fem,
                  //         // top: -360*fem,
                  //         child: Align(
                  //           child: SizedBox(
                  //             width: 1494*fem,
                  //             height: 419*fem,
                  //             child: Image.asset(
                  //               'assets/icons/component-1.png',
                  //               width: 1494*fem,
                  //               height: 419*fem,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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