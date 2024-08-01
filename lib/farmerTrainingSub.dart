import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:training_booking/Admin/courseadd.dart';
import 'package:training_booking/Admin/suggested.dart';
import 'package:training_booking/categories.dart';
import 'package:training_booking/farmers_training2.dart';
import 'package:training_booking/institutesignin.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_booking/Admin/ViewDetails.dart';
import 'package:training_booking/farmers_training.dart';


class Sub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 355;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0x7c89a984),
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
      body:  Container(
        
          width: double.infinity,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x7c89a984),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 350.76 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(29 * fem),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/rectangle-388-bg.png'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 230),
                      Text(
                        'കർഷക പരിശീലനം',
                        style: safeGoogleFont(
                          'Inria Serif',
                          fontSize: 40 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.1975 * ffem / fem,
                          letterSpacing: 1.28 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 65.9 * fem),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70/0.0099 ,
                      //height: 100,
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(200),
                         color: Color.fromRGBO(250, 253, 253, 1),
                      ),
                      
                      child: ListTile(
                        
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scene6(),
                            ),
                          );
                        },
                        title: Text(
                          'ലഭ്യമായ പരിശീലനം',
                          textAlign: TextAlign.center,
                          style: safeGoogleFont(
                            'Istok Web',
                            fontSize: 19 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.44 * ffem / fem,
                            letterSpacing: 0.4 * fem,
                            color: Color(0xff73c268),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 23 * fem),
                    Container(
                      width:19 * ffem/0.0099 ,
  
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         color: Color.fromRGBO(250, 250, 250, 1),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => farmersTraining2(),
                            ),
                          );
                        },
                        title: Text(
                          'താൽപ്പര്യമുള്ള പരിശീലനം',
                          textAlign: TextAlign.center,
                          style: safeGoogleFont(
                            'Istok Web',
                            fontSize: 19 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.84 * ffem / fem,
                            letterSpacing: 0.4 * fem,
                            color: Color(0xff73c268),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 23 * fem),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      //),
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
