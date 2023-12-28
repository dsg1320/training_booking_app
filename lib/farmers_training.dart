import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:training_booking_app/CourseListWidget.dart';

class Scene6 extends StatelessWidget {
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
            // farmerstrainingt2d (203:1268)
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 40 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffb1ccac),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupux5sPEH (Lu2AKL3FG3rD9qyyTZuX5s)
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
                      image: AssetImage(
                        'assets/rectangle-389-bg-h8u.png',
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
                      Container(
                        // 1mT (206:1201)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 340 * fem, 47 * fem, 0 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 150 * fem,
                        ),
                        child: Text(
                          'കർഷക പരിശീലനം',
                          style: safeGoogleFont(
                            'Inter',
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffdcd7d7),
                          ),
                        ),
                      ),
                      Container(
                        // vectorheH (38:9)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 2 * fem, 13.91 * fem, 0 * fem),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 10.09 * fem,
                            height: 15.63 * fem,
                            child: Image.asset(
                              'assets/vector-MkD.png',
                              width: 10.09 * fem,
                              height: 15.63 * fem,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        // vectorBZT (38:3)
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 25 * fem,
                          height: 15.44 * fem,
                          child: Image.asset(
                            'assets/vector-XGd.png',
                            width: 25 * fem,
                            height: 19.44 * fem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // availabletrainingsWrd (203:1278)
                  margin: EdgeInsets.fromLTRB(
                      20 * fem, 0 * fem, 100 * fem, 8.5 * fem),
                  child: Text(
                    'ലഭ്യമായ പരിശീലനങ്ങൾ :',
                    style: safeGoogleFont(
                      'Inter',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                CourseListWidget('Farmers Training'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
