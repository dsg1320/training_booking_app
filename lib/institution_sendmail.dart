import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/main.dart';
import 'package:training_booking/utils.dart';
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
  late DatabaseReference _dataRef;
  late StreamSubscription<DatabaseEvent> _subscription;
  late StreamSubscription<DatabaseEvent> _courseSubscription;
  List<Map<String, dynamic>> mailList = [];
  String? selectedCourse;
  String? selectedCategory;
  DateTime selectedDate = DateTime.now();
  String instituteName = '';
  //late DatabaseReference _databaseRef;
  late DatabaseReference _courseref;
  List<String>coursesList=[];
  String loggedInInstituteName='';

  List<String>categoryList=[
    'Livestock Inspector Training',
    'Farmers Training',
    'Officer Training',
    'Awareness Programme',
    'Course',
  ];


  @override
  void initState() {
    super.initState();
    selectedCourse = coursesList.isNotEmpty ? coursesList[0] : null;
    dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Booking');
   ''' _databaseRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Coursename');''';
    _courseref = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Courses');

    _subscription = dbRef.onValue.listen((event) {
      if (event.snapshot.value != null){
        DataSnapshot snapshot = event.snapshot;
        fetchData();
      }
    });
    //_courseSubscription = _databaseRef.onValue.listen((event) {
    //  if (event.snapshot.value != null){
    //    DataSnapshot snapshot = event.snapshot;
    //    fetchCourseNames();
     // }
  //  });// Call method to fetch data initially
  }

  @override
  void dispose() {
    _subscription.cancel();
    _courseSubscription.cancel();
    super.dispose();
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = DateTime(picked.year,picked.month,picked.day);
      });
    }
  }

  void fetchData() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null){
      String loggedInInstituteName = user.displayName ?? '';
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
  Future<List<String>> getCoursesForCategory(String category) async {
    final DatabaseEvent event = await _courseref.child(category).once();

    List<String> courses = [];

    // Check if the snapshot value is not null and is a Map
    if (event.snapshot.value != null && event.snapshot.value is Map) {
      // Debug print statement to check the snapshot value
      print("Snapshot value: ${event.snapshot.value}");

      // Iterate through the map and add names to the list
      (event.snapshot.value as Map<dynamic, dynamic>).forEach((key, value) {
        print("Key: $key, Value: $value");
        print("Type: ${value.runtimeType}");// Debug print statement

        // Check if the value is a map and contains 'name' key
        if (value is Map<dynamic, dynamic> && value['name']!=null) {
          print("Key: $key, Value: $value"); // Debug print statement
          courses.add(value['name']);
        }
      });
    } else {
      print("Snapshot value is null or not a map.");
    }

    print("Courses: $courses"); // Debug print statement

    return courses;
  }



  //void fetchCourseNames() {
 //   _databaseRef.child('courseNames').onValue.listen((DatabaseEvent event) {
   //   if (event.snapshot.value != null) {
    //    List<dynamic> values = event.snapshot.value as List<dynamic>;
     //   coursesList.clear(); // Clear existing list before updating

      //  values.forEach((value) {
      //    coursesList.add(value.toString());
     //   });
      //  _dataRef = FirebaseDatabase.instanceFor(
     //     app: Firebase.app(),
     //     databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
     //   ).ref('Courses');
     //   // Set state after fetching data to trigger rebuild with fetched data
      //  setState(() {});
   //   }
  //  });

 // }

  Future<void> getCourseId(String? selectedCategory, String? selectedCourse, DateTime selectedDate) async {
    if (selectedCategory == null || selectedCourse == null) {
      return;
    }
    _dataRef.child(selectedCategory).onValue.listen((DatabaseEvent event) async {
      if(event.snapshot.value != null){
        Map<dynamic, dynamic>? courses = event.snapshot.value as Map<dynamic, dynamic>?;
        if (courses != null) {
          for (var entry in courses.entries) {
            String courseId = entry.key;
            Map<dynamic, dynamic> courseData = entry.value as Map<dynamic, dynamic>;

            // Check if the course name matches the selected course name
            if (courseData['name'] == selectedCourse) {
              String formattedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
              Map<String, dynamic> updatedData = {
                'name': courseData['name'],
                'description': courseData['description'],
                'date': formattedDate,
              };
              await _dataRef.child(selectedCategory!).child(courseId).set(updatedData);
              return;
            }
          }
        }

      }

    });
  }





  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),),
      body: SingleChildScrollView(
       child: Container(
       width: double.infinity,
        child: Container(
        // institutionssendemailQb3 (218:1252)
        padding: EdgeInsets.fromLTRB(28*fem, 212*fem, 23*fem, 417*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffd9d9d9)
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
                        'അറിയിപ്പ് അയയ്ക്കുക',
                        textAlign: TextAlign.center,
                        style: safeGoogleFont (
                          'Inter',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.0*ffem/fem,
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
                  await showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return StatefulBuilder(
                          builder:(BuildContext context, StateSetter setState){
                      //selectedCourse = coursesList.isNotEmpty ? coursesList[0] : null;
                            print(coursesList);
                            return AlertDialog(
                              title: Text('Select Course and Date'),
                              content: Container(
                                width: 500*fem,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    DropdownButtonFormField<String>(
                                      value: selectedCategory,
                                      onChanged: (String? newValue) async {
                                        setState(() {
                                          selectedCategory = newValue!;
                                          selectedCourse = null;
                                        });
                                        List<String> courses = await getCoursesForCategory(selectedCategory!);
                                        setState(() {
                                          coursesList = courses;
                                          //selectedCourse = courses.isNotEmpty ? courses[0] : null;
                                        });
                                      },
                                      items: categoryList.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value, style: TextStyle(fontSize: 13)),
                                        );
                                      }).toList(),
                                    ),
                                      DropdownButtonFormField<String>(
                                        value: selectedCourse ?? (coursesList.isNotEmpty ? coursesList[0] : null),
                                        onChanged: (String? newValue) async{
                                          setState((){
                                            selectedCourse= newValue!;
                                          });
                                        },
                                        items: coursesList.map((String value){
                                          return DropdownMenuItem<String>(
                                            value:value,
                                            child: Text(value, style: TextStyle(fontSize: 13)),
                                          );
                                        }).toList(),
                                      ),
                                      //SizedBox(height:20),
                                      ElevatedButton(
                                        onPressed: ()=> _selectDate(context),
                                        child: Text('Select date'),
                                      ),
                                      SizedBox(height:20),
                                    ],
                                ),
                              ),
                              actions:[
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ക്യാൻസൽ'),
                                ),
                                TextButton(
                                  onPressed: () async{
                                     await getCourseId(selectedCategory, selectedCourse,selectedDate);
                                      Navigator.of(context).pop();
                                  },
                                  child: Text('സമർപ്പിക്കുക'),
                                ),
                              ],
                            );
                          });
                    },
                  );
                  List<String> emailAddresses = mailList.map((map) => map['email'] as String).toList();

                  // Create a comma-separated string of email addresses
                  String emailList = emailAddresses.join(',');
                  String emailBody =
                      'Course: $selectedCourse\nDate: ${selectedDate.toLocal()}';
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: emailList,
                    queryParameters: {
                      'subject': 'Here is a Remainder',
                      'body': emailBody,
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
                        'ഷെഡ്യൂൾ അയയ്ക്കുക',
                        textAlign: TextAlign.center,
                        style: safeGoogleFont (
                          'Inter',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.0*ffem/fem,
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