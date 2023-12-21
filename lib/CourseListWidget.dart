

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/Admin/courseadd.dart';
import 'package:training_booking_app/bookingPage.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:training_booking_app/main.dart';
import 'package:training_booking_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';



class CourseListWidget extends StatelessWidget {
  final String category;

  CourseListWidget(this.category);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      height: 170 * fem,
     child: FutureBuilder<List<Course>>(
      future: getCoursesByCategory(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while fetching data.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No courses available in this category.');
        } else {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget> [
              SizedBox(
                width:20,
              ),
              for(int index=0; index < snapshot.data!.length; index++)
                Container(
                  width: 260,// Adjust the width as needed
                  margin: EdgeInsets.only(right: 20.0 * fem), // Add spacing between boxes
                  child: buildCourseBox(context,fem, ffem, snapshot.data![index],category),
                )
            ],
          );
        }
      },
    ),
    );
  }
}

Widget buildCourseBox(BuildContext context,double fem, double ffem, Course? course,String category) {
  return Container(
    // autogroupuosyXTw (Lu2WwQLxFcNyJND6F3UoSy)
    width: double.infinity,
    height: 170*fem,

        child: Container(
          // autogroupckgdMxm (Lu2X4pJGWT8j77LdQUCKgD)
          padding: EdgeInsets.fromLTRB(17*fem, 8.5*fem, 15*fem, 0*fem),
          width: 218*fem,
          height: double.infinity,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                // 3ah (309:1304)
                child: Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                  constraints: BoxConstraints (
                    maxWidth: 186*fem,
                  ),
                  child: Text(
                    course!.name,
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
              Container(
                // vector86M (309:1305)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 12*fem,
                    height: 13*fem,
                    child: Image.asset(
                      'assets/vector-pQ9.png',
                      width: 12*fem,
                      height: 13*fem,
                    ),
                  ),
                ),
              ),
              Container(
                // rectangle393RLM (309:1303)
                margin: EdgeInsets.fromLTRB(29*fem, 0*fem, 32*fem, 0*fem),
                child: TextButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(category: category,course: course!.name,)));
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // booknowLiD (I309:1303;200:1207)
                          left: 22*fem,
                          top: 11*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 82*fem,
                                height: 20*fem,
                                child: Text(
                                  'Book Now!',
                                  textAlign: TextAlign.center,
                                  style: safeGoogleFont (
                                    'Inter',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle393qQ5 (I309:1303;200:1203)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 125*fem,
                              height: 41*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(20*fem),
                                  color: Color(0x5835703b),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x06000000),
                                      offset: Offset(0*fem, 2.095284462*fem),
                                      blurRadius: 1.3739570379*fem,
                                    ),
                                    BoxShadow(
                                      color: Color(0x08000000),
                                      offset: Offset(0*fem, 5.2991318703*fem),
                                      blurRadius: 3.4748404026*fem,
                                    ),
                                    BoxShadow(
                                      color: Color(0x0a000000),
                                      offset: Offset(0*fem, 10.8097314835*fem),
                                      blurRadius: 7.0883488655*fem,
                                    ),
                                    BoxShadow(
                                      color: Color(0x0c000000),
                                      offset: Offset(0*fem, 22.2660045624*fem),
                                      blurRadius: 14.6006584167*fem,
                                    ),
                                    BoxShadow(
                                      color: Color(0x11000000),
                                      offset: Offset(0*fem, 61*fem),
                                      blurRadius: 40*fem,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}

Future<List<Course>> getCoursesByCategory(String category) async {
  final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .ref("Courses");
  final DatabaseEvent event = await dbRef.child('$category').once();

  if (event.snapshot.value != null) {
    final Map<Object?,Object?>? courseData = event.snapshot.value as Map<Object?,Object?>?;
    List<Course> courses = [];

    courseData?.forEach((courseId, courseInfo) {
      if (courseInfo is Map<Object?, Object?>) {
        // Ensure courseInfo is a Map<Object?, Object?> before creating a Course object
        Course course = Course.fromMap(courseInfo);
        courses.add(course);
      }
    });

    return courses;
  } else {
    return [];
  }
}


