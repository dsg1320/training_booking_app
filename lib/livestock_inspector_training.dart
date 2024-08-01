import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/CourseListWidget.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';

class Scene7 extends StatelessWidget {
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
        // livestockinspectortraining2fSh (309:1250)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 82*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupnhwfNru (Lu2TDvhf8UoyNKmYzRNHwF)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
              width: double.infinity,
              height: 438*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle389h8V (309:1251)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 360*fem,
                        height: 420*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                            color: Color(0xffd9d9d9),
                            image: DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/rectangle-389-bg-uAZ.png',
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
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ZwP (309:1252)
                    left: 14*fem,
                    top: 300*fem,
                    child: Align(
                      child: SizedBox(
                        width: 279*fem,
                        height: 120*fem,
                        child: Text(
                          'ലൈവ്സ്റ്റോക്ക് ഇൻസ്‌പെക്ടർ ട്രെയിനിങ് ',
                          style: safeGoogleFont (
                            'Inter',
                            fontSize: 28*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125*ffem/fem,
                            color: Color(0xffddd7d7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // availabletrainingsEw3 (309:1260)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 137*fem, 15*fem),
              child: RichText(
                text: TextSpan(
                  style: safeGoogleFont (
                    'Inter',
                    fontSize: 32*ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.2125*ffem/fem,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '  ',
                    ),
                    TextSpan(
                      text: 'പരിശീലനങ്ങൾ:',
                      style: safeGoogleFont (
                        'Inter',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CourseListWidget('Livestock Inspector Training')
          ],
        ),
      ),
    ),
    ),
    );
  }
}