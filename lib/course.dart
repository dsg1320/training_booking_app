import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/CourseListWidget.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';

class Scene5 extends StatelessWidget {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
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
                'assets/vector-qTX.png',
                width: 30,
                height: 30,
                color: Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Notifications',
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
            // coursesZLm (309:1300)
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 79 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffb1ccac),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupojt75a1 (Lu2Wj5NAFhKwVGJocWojT7)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 0 * fem, 53.5 * fem),
                  padding: EdgeInsets.fromLTRB(
                      27.5 * fem, 58 * fem, 0 * fem, 25 * fem),
                  width: double.infinity,
                  height: 429 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20 * fem),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/rectangle-389-bg-ffw.png',
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        // iN5 (309:1309)
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 270 * fem, 70.5 * fem, 0 * fem),
                          child: Text(
                            'കോഴ്സ',
                            textAlign: TextAlign.center,
                            style: safeGoogleFont(
                              'Inter',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffddd7d7),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // vectorav5 (309:1311)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 3 * fem, 10.91 * fem, 0 * fem),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 10.09 * fem,
                            height: 15.63 * fem,
                            child: Image.asset(
                              'assets/vector-znm.png',
                              width: 10.09 * fem,
                              height: 15.63 * fem,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        // vectorHZb (309:1310)
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 25 * fem,
                          height: 19.44 * fem,
                          child: Image.asset(
                            'assets/vector-oAH.png',
                            width: 25 * fem,
                            height: 19.44 * fem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // availablecoursesRA1 (309:1308)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 140 * fem, 19.5 * fem),
                  child: Text(
                    'ലഭ്യമായ കോഴ്‌സുകൾ',
                    style: safeGoogleFont(
                      'Inter',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                CourseListWidget('Course')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
