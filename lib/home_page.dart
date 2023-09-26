import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:training_booking_app/categories.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'dart:ui';
import 'package:training_booking_app/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(39*fem, 48*fem, 0*fem, 62*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffa4e299),
          borderRadius: BorderRadius.circular(2*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(62.5*fem, 0*fem, 103.5*fem, 11.5*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                    width: 145*fem,
                    height: 108*fem,
                    child: Image.asset(
                      'assets/govt-kerala-1-removebg-preview.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Government of Kerala',
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
              padding: EdgeInsets.fromLTRB(2*fem, 0*fem, 2*fem, 25*fem),
              width: 446*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.5*fem),
                      width: double.infinity,
                      constraints: BoxConstraints (
                        maxWidth: 278*fem,
                      ),
                      child: Text(
                        'ലൈവ്സ്റ്റോക്ക് മാനേജ്‌മന്റ് ആൻഡ് ട്രെയിനിങ് സെന്റർ',
                        textAlign: TextAlign.center,
                        style: safeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2125*ffem/fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(22*fem, 0*fem, 0*fem, 0*fem),
                    width: 237.27*fem,
                    height: 240*fem,
                    child: Image.asset(
                      'assets/images-1-TWy-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                  child: Text("Admin or Institute"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Scene1()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                  child: Text("Applicant"),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}