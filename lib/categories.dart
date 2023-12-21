import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/awareness.dart';
import 'package:training_booking_app/course.dart';
import 'package:training_booking_app/farmers_training.dart';
import 'package:training_booking_app/livestock_inspector_training.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/officer_training.dart';
import 'package:training_booking_app/utils.dart';
import 'package:training_booking_app/home_page.dart';

class Scene1 extends StatelessWidget {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
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
        // categoriesLG9 (12:6)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupux5sPEH (Lu2AKL3FG3rD9qyyTZuX5s)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 60.5*fem),
              padding: EdgeInsets.fromLTRB(14*fem, 40*fem, 16*fem, 29*fem),
              width: double.infinity,
              height: 467*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/rectangle-388-bg.png',
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // 1mT (206:1201)
                    margin: EdgeInsets.fromLTRB(4*fem, 303*fem, 50*fem, 0*fem),
                    constraints: BoxConstraints (
                      maxWidth: 150*fem,
                    ),
                    child: Text(
                      'ഇനം തിരഞ്ഞെടുക്കുക',
                      style: safeGoogleFont (
                        'Inter',
                        fontSize: 25*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2125*ffem/fem,
                        color: Color(0xffdcd7d7),
                      ),
                    ),
                  ),
                  Container(
                    // vectorheH (38:9)
                    margin: EdgeInsets.fromLTRB(0*fem,2*fem, 13.91*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 10.09*fem,
                        height: 15.63*fem,
                        child: Image.asset(
                          'assets/vector-MkD.png',
                          width: 10.09*fem,
                          height: 15.63*fem,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    // vectorBZT (38:3)
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 25*fem,
                      height: 15.44*fem,
                      child: Image.asset(
                        'assets/vector-XGd.png',
                        width: 25*fem,
                        height: 19.44*fem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupngx9bUu (Lu1ocLi4XR2Azxz7CzNgx9)
              width: double.infinity,
              height: 451.24*fem,
              child: Stack(
                children: [
                  Positioned(
                    // autogroupttpvVqB (Lu1oL1qvuUSNi3iAGLtTpV)
                    left: 14*fem,
                    top: 13.2391967773*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(9*fem, 13*fem, 12.5*fem, 30*fem),
                      width: 329*fem,
                      height: 303*fem,
                      decoration: BoxDecoration (
                        color: Color(0x667ab371),
                        borderRadius: BorderRadius.circular(13*fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // trainingsuP7 (200:1216)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 100*fem),
                            child: Text(
                              'Trainings:',
                              style: safeGoogleFont (
                                'Inter',
                                fontSize: 20*ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.2125*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupapi9BbX (Lu1oSgKVcBezB5LG7saPi9)
                            margin: EdgeInsets.fromLTRB(167.5*fem, 30*fem, 0*fem, 0*fem),
                            width: 140*fem,
                            height: 102*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // rectangle4HeZ (21:22)
                                  left: 0.5*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 137*fem,
                                      height: 102*fem,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Scene7()));
                                        },
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(10*fem),
                                            color: Color(0x7c89a984),
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
                                ),
                                Positioned(
                                  // 9gm (33:8)
                                  left: 0*fem,
                                  top: 20.5*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 140*fem,
                                        height: 78*fem,
                                        child: Text(
                                          'ലൈവ്സ്റ്റോക്ക് ഇൻസ്‌പെക്ടർ ട്രെയിനിങ് ',
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle2oWR (200:1212)
                    left: 32*fem,
                    top: 64.2391967773*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(3.5*fem, 23*fem, 3.5*fem, 30*fem),
                      width: 137*fem,
                      height: 102*fem,
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
                      child: Center(
                        // UMf (21:25)
                        child: Center(
                          child: SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Scene6()));
                              },
                            child: Container(
                              constraints: BoxConstraints (
                                maxWidth: 130*fem,
                              ),
                              child: Text(
                                'കർഷക പരിശീലനം',
                                textAlign: TextAlign.center,
                                style: safeGoogleFont (
                                  'Inter',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle69ih (200:1213)
                    left: 188*fem,
                    top: 48.2391967773*fem,
                    child: Container(
                      width: 143*fem,
                      height: 126*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle6G2d (21:24)
                            left: 3*fem,
                            top: 19*fem,
                            child: Align(
                              child: SizedBox(
                                width: 137*fem,
                                height: 102*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Scene8()));
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(10*fem),
                                      color: Color(0x7c89a984),
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
                          ),
                          Positioned(
                            // vss (23:26)
                            left: 6.5*fem,
                            top: 45*fem,
                            child: Center(
                              child: Align(
                                child: SizedBox(
                                  width: 142*fem,
                                  height: 49*fem,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'ഉദ്യോഗസ്ഥ പരിശീലനം',
                                          style: safeGoogleFont (
                                            'Inter',
                                            fontSize: 20*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2125*ffem/fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
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
                  Positioned(
                    // rectangle38W5 (200:1214)
                    left: 32*fem,
                    top: 183.2391967773*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5.5*fem, 22*fem, 1.5*fem, 21*fem),
                      width: 137*fem,
                      height: 102*fem,
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
                      child: Center(
                        // BjF (33:6)
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Scene2()));
                              },
                             child: Container(
                              constraints: BoxConstraints (
                                maxWidth: 130*fem,
                              ),
                              child: Text(
                                'പൊതു ജനങ്ങൾക്കുള്ള ബോധവത്കരണം',
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle54o3 (200:1215)
                    left: 108*fem,
                    top: 328.2391967773*fem,
                    child: Container(
                      width: 137*fem,
                      height: 110*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle5Bsf (21:23)
                            left: 0*fem,
                            top: 3.2156982422*fem,
                            child: Align(
                              child: SizedBox(
                                width: 137*fem,
                                height: 82*fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Scene5()));
                                  },
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(10*fem),
                                      color: Color(0x7c89a984),
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
                          ),
                          Positioned(
                            // bRb (33:9)
                            left: 41.5*fem,
                            top: 30.5*fem,
                            child: Center(
                              child: Align(
                                child: SizedBox(
                                  width: 49*fem,
                                  height: 40*fem,
                                  child: Text(
                                    'കോഴ്സ',
                                    textAlign: TextAlign.center,
                                    style: safeGoogleFont (
                                      'Inter',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125*ffem/fem,
                                      color: Color(0xff000000),
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