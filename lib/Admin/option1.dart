import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
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
        // frame584zxZ (235:1498)
        width: double.infinity,
        height: 800 * fem,
        child: Container(
          // adminspageA6M (220:1216)
          // width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff1eaea),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                // autogroupntustY9 (5CSLvEr45zVQtQZgddNTUs)
                padding:
                    EdgeInsets.fromLTRB(31 * fem, 19 * fem, 18 * fem, 45 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupuxlk28Z (5CSLozXToaMDPSfiPpUXLK)
                      // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 36*fem),
                      // width: double.infinity,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // ellipse4k4Z (228:1394)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 10 * fem, 241 * fem, 0 * fem),
                            width: 45 * fem,
                            height: 45 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5 * fem),
                              border: Border.all(
                                  color: Color.fromARGB(255, 170, 172, 174)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/AdminIcons/dp.png',
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            // vectorSi5 (220:1225)
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 25 * fem,
                              height: 19.44 * fem,
                              child: Image.asset(
                                'assets/AdminIcons/homeIcon.png',
                                width: 25 * fem,
                                height: 19.44 * fem,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // mEZ (224:1391)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 94 * fem, 0 * fem),
                      child: Text(
                        'കർഷക പരിശീലനം',
                        style: safeGoogleFont(
                          'Inter',
                          fontSize: 26 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xff627d59),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // frame586T7P (235:1500)
                width: 401 * fem,
                height: 615 * fem,
                child: Container(
                  // group75917zt1 (233:1497)
                  width: double.infinity,
                  height: 646 * fem,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'ആട് വളർത്തൽ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // OPTION 2
                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'മുട്ട കോഴി വളർത്തൽ ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //OPTION 3
                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'ഇറച്ചി കോഴി വളർത്തൽ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'തീറ്റ പുൽ കൃഷി',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //OPTION5

                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'എരുമ വളർത്തൽ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // OPTION 6

                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'ഓമന പക്ഷികളുടെ വളർത്തൽ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //OPTION 6

                      Container(
                        // group75918WrM (235:1501)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 3 * fem, 0 * fem),
                        width: 398 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group80RyK (228:1406)
                              left:
                                  34 * fem, //alignment from left of the option
                              top: 17 * fem,
                              child: Container(
                                // width: 173*fem,
                                // height: 49*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // M6H (228:1407)
                                      'ഓമന മൃഗങ്ങളുടെ വളർത്തൽ',
                                      style: safeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      // pkr260005HB (228:1408)
                                      'തിയതി : PKR2,6000',
                                      style: safeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff637d59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle125C6u (228:1409)
                              // left: 0*fem,
                              // top: 0*fem,
                              //child: Align(
                              child: SizedBox(
                                width: 398 * fem,
                                height: 91 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x26999999)),
                                  ),
                                ),
                              ),
                              //),
                            ),
                            Positioned(
                              // keyboardarrowuppPB (228:1411)
                              left:
                                  315.0 * fem, // for the spacing of right arrow
                              top: 26.1625061035 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 34.43 * fem,
                                  height: 38.68 * fem,
                                  child: Image.asset(
                                    'assets/AdminIcons/rightArrow.png',
                                    width: 24.43 * fem,
                                    height: 38.68 * fem,
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
            ],
          ),
        ),
      ),
    );
  }
}
