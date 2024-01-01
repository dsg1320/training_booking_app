import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Scene4 extends StatefulWidget {
  @override
  _Scene4Page createState() => _Scene4Page();
}
class _Scene4Page extends State<Scene4> {
  late DatabaseReference dbRef;
  late StreamSubscription<DatabaseEvent> _subscription;
  List<Map<String, dynamic>> mailList = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Booking');
    _subscription = dbRef.onValue.listen((event) {
      if (event.snapshot.value != null){
        DataSnapshot snapshot = event.snapshot;
        fetchData();
      }
    });// Call method to fetch data initially
  }

  @override
  void dispose() {
    _subscription?.cancel(); // Cancel the listener when the widget is disposed of
    super.dispose();
  }

  void fetchData() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null){
      String loggedInInstituteName = user.displayName ?? '';
      print(loggedInInstituteName);
      dbRef.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;

          mailList.clear(); // Clear existing list before updating

          values.forEach((key, value) {
            if (value['institute'] == loggedInInstituteName){
              mailList.add({
                'email': value['email'],
              });

            }
          });

          // Set state after fetching data to trigger rebuild with fetched data
          setState(() {});
        }
      });
    }
  }
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
        // institutionssendemailQb3 (218:1252)
        padding: EdgeInsets.fromLTRB(28*fem, 212*fem, 23*fem, 417*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffb1ccac),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // rectangle389X9s (218:1254)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(20*fem, 23*fem, 22*fem, 14.56*fem),
              width: 139*fem,
              height: 116*fem,
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
              child: InkWell(
                onTap: () async{
                  List<String> emailAddresses = mailList.map((map) => map['email'] as String).toList();

                  // Create a comma-separated string of email addresses
                  String emailList = emailAddresses.join(',');
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: emailList,
                    queryParameters: {
                      'subject': 'Here is a Remainder',
                      'body':
                          'Get ready for your training!'
                    },
                  );
                 launch(emailUri.toString());

                },
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    // sendmailBkD (I218:1254;21:25)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                      constraints: BoxConstraints (
                        maxWidth: 97*fem,
                      ),
                      child: Text(
                        'Send a reminder',
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
                  Container(
                    // vectorVF7 (218:1263)
                    margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 0*fem),
                    width: 25*fem,
                    height: 19.44*fem,
                    child: Image.asset(
                      'assets/vector-ciV.png',
                      width: 25*fem,
                      height: 19.44*fem,
                    ),
                  ),
                ],
              ),
            ),
            ),
            Container(
              // rectangle390pHP (218:1257)
              padding: EdgeInsets.fromLTRB(23.5*fem, 23*fem, 25.5*fem, 15*fem),
              width: 139*fem,
              height: 116*fem,
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
              child: InkWell(
                onTap: () async{
                  List<String> emailAddresses = mailList.map((map) => map['email'] as String).toList();

                  // Create a comma-separated string of email addresses
                  String emailList = emailAddresses.join(',');
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: emailList,
                    queryParameters: {
                      'subject': 'Here is a Remainder',
                      'body':
                      'Get ready for your training!'
                    },
                  );
                  launch(emailUri.toString());

                },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    // sendmailuJq (I218:1257;21:25)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                      constraints: BoxConstraints (
                        maxWidth: 90*fem,
                      ),
                      child: Text(
                        'Send the Schedule',
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
                  Container(
                    // vectorbSZ (218:1261)
                    margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 0*fem),
                    width: 21.88*fem,
                    height: 25*fem,
                    child: Image.asset(
                      'assets/vector-EQH.png',
                      width: 21.88*fem,
                      height: 25*fem,
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
    ),
    );
  }
}