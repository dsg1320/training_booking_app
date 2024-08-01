import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:training_booking/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // categoriesysF (191:1658)
        padding: EdgeInsets.fromLTRB(12*fem, 18*fem, 4*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff2ebeb),
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/Img/categories-bg.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // vectorsxd (191:1671)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 101.56*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: InkWell(
                  onTap: () {
                    // goto home page( welcome page)
                  },
                  child: Container(
                    width: 25*fem,
                    height: 19.44*fem,
                    child: Image.asset(
                      'assets/AdminIcons/homeIcon.png',
                      width: 25*fem,
                      height: 19.44*fem,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // Mcu (191:1670)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 110*fem, 44*fem),
              //margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
              child: Text(
                'വിഭാഗങ്ങൾ ',
                style: safeGoogleFont (
                  'Inter',
                  fontSize: 35*ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.2125*ffem/fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Container(
              // autogroupyent3kd (5CSPZATF6W2kEQ6hacyENT)
              width: double.infinity,
              height: 570*fem,
              child: Stack(
                children: [
                  Positioned(
                    // frame583oE1 (228:1496)
                    left: 12*fem,
                    top: 0*fem,
                    child: Container(
                      width: 320*fem,
                      height: 570*fem,
                      child: Container(
                        // coursersj7f (191:1745)
                        width: double.infinity,
                        height: 625.66*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(15*fem),
                        ),
                        child: ListView(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // course1T3f (191:1746)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
                              
                                child: InkWell(
                                  onTap: () {
                                    print("pressed1");
                                  },
                                  child: Container(
                                    // group759057e1 (228:1401)
                                    padding: EdgeInsets.fromLTRB(22.07*fem, 37.96*fem, 22.07*fem, 38.7*fem),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff2ebeb),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Text(
                                      'കർഷക പരിശീലനം',
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 22*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff243836),
                                      ),
                                    ),
                                  ),
                                ),
                              //),
                            ),
                            
                             Container(
                              // course1T3f (191:1746)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
                              // child: TextButton(
                              //   onPressed: () {},
                              //   style: TextButton.styleFrom (
                              //     padding: EdgeInsets.zero,
                              //   ),
                                child: InkWell(
                                  onTap: () {
                                    print("pressed2");
                                  },
                                  child: Container(
                                    // group759057e1 (228:1401)
                                    padding: EdgeInsets.fromLTRB(22.07*fem, 37.96*fem, 22.07*fem, 38.7*fem),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff2ebeb),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Text(
                                      'ഉദ്യോഗസ്ഥ പരിശീലനം',
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 22*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff243836),
                                      ),
                                    ),
                                  ),
                                ),
                              //),
                            ),
                            
                            Container(
                              // course1T3f (191:1746)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
                              
                                child: InkWell(
                                  onTap: () {
                                    print("pressed3");
                                  },
                                  child: Container(
                                    // group759057e1 (228:1401)
                                    padding: EdgeInsets.fromLTRB(22.07*fem, 37.96*fem, 22.07*fem, 38.7*fem),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff2ebeb),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Text(
                                      'പൊതു ജനങ്ങൾക്കുള്ള ബോധവത്കരണം',
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 22*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff243836),
                                      ),
                                    ),
                                  ),
                                ),
                              //),
                            ),
                           
                            Container(
                              // course1T3f (191:1746)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
                              // child: TextButton(
                              //   onPressed: () {},
                              //   style: TextButton.styleFrom (
                              //     padding: EdgeInsets.zero,
                              //   ),
                                child: InkWell(
                                  onTap: () {
                                    print("pressed4");
                                  },
                                  child: Container(
                                    // group759057e1 (228:1401)
                                    padding: EdgeInsets.fromLTRB(22.07*fem, 37.96*fem, 22.07*fem, 38.7*fem),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff2ebeb),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Text(
                                      'ലൈവ്സ്റ്റോക്ക് ഇൻസ്‌പെക്ടർ ട്രെയിനിങ് ',
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 22*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff243836),
                                      ),
                                    ),
                                  ),
                                ),
                              //),
                            ),
                           
                            Container(
                              // course1T3f (191:1746)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
                              // child: TextButton(
                              //   onPressed: () {},
                              //   style: TextButton.styleFrom (
                              //     padding: EdgeInsets.zero,
                              //   ),
                                child: InkWell(
                                  onTap: () {
                                    print("pressed5");
                                  },
                                  child: Container(
                                    // group759057e1 (228:1401)
                                    padding: EdgeInsets.fromLTRB(22.07*fem, 37.96*fem, 22.07*fem, 38.7*fem),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff2ebeb),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Text(
                                      'ചിക്ക് സെക്സിങ് ',
                                      style: safeGoogleFont (
                                        'Inter',
                                        fontSize: 22*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff243836),
                                      ),
                                    ),
                                  ),
                                ),
                              //),
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
          );
  }
}