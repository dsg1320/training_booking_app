
import 'package:flutter/material.dart';
import 'package:training_booking/categories.dart';
import 'package:training_booking/institutesignin.dart';
import 'dart:ui';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,

      child: Container(
        padding: EdgeInsets.fromLTRB(39 * fem, 48 * fem, 0 * fem, 62 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffa4e299),
          borderRadius: BorderRadius.circular(2 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  62.5 * fem, 0 * fem, 103.5 * fem, 11.5 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.only(bottom: 20),
                    /* margin:EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                    width: 145 * fem,
                    height: 108 * fem, */
                    child: Image.asset(
                      'assets/govt-kerala-1-removebg-preview.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 340,
                      child: Text(
                        'Government of Kerala',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
                padding:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 25 * fem),
                width: 446 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 3.5 * fem),
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 278 * fem,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            'ലൈവ്സ്റ്റോക്ക് മാനേജ്‌മന്റ് ട്രെയിനിങ് സെന്റർ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.fromLTRB(52 * fem, 0 * fem, 0 * fem,
                          0 * fem), // Increase the left margin
                      width: 190 * fem,
                      height: 190 * fem,
                      child: Image.asset(
                        'assets/images-1-TWy-removebg-preview.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0),
            Padding(
              padding:
              EdgeInsets.only(right: 35.0), // Adjust the padding as needed
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(76, 175, 80, 1),
                          onPrimary: Colors.white,
                        ),
                        child: Text("അഡ്മിൻ/ഇൻസ്റ്റിറ്റ്യൂട്ട്"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scene1()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                        ),
                        child: Text("അപേക്ഷകർ"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}