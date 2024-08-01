import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';

class Course {
  final String name;
  final String description;
  final String date;

  Course(this.name, this.description, this.date);

  // Create a Course object from a map
  Course.fromMap(Map<Object?, Object?> map)
      : name = map['name'] as String? ?? '',
        description = map['description'] as String? ?? '',
        date = map['date'] as String? ?? '';
}

late DatabaseReference dbRef;

class CourseFormScreen extends StatefulWidget {
  @override
  _CourseFormScreenState createState() => _CourseFormScreenState();
}

class _CourseFormScreenState extends State<CourseFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  late DatabaseReference dbRef;
  String? selectedInstitute;

  List<String> instituteNames = [
    'LMTC കുടപ്പനക്കുന്ന്,തിരുവനന്തപുരം',
    'LMTC കൊട്ടിയം, കൊല്ലം',
    'LMTC തലയോലപ്പറമ്പ്,കോട്ടയം',
    'LMTC വാഗമൺ, ഇടുക്കി',
    'LMTC ആലുവ എറണാകുളം',
    'LMTC മലമ്പുഴ, പാലക്കാട്',
    'LMTC ആദവനാട്, മലപ്പുറം',
    'LMTC മുണ്ടയാട്, കണ്ണൂർ',
    'LMTC സുൽത്താൻബത്തേരി, വയനാട്',
    // Add other institute names as needed
  ];

  void _addCourse(String category) {
    final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
        'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .ref("Courses");

    // Generate a unique key for the course
    final String ?courseId = dbRef.child('$category').push().key;

    // Create a map containing course details
    final Map<String, dynamic> courseData = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'institute' : category == 'Farmers Training' ? _instituteController.text : null,
      'date' : "",
    };

    // Push the course data to the Firebase database
    dbRef.child('$category/$courseId').set(courseData);

    // Clear the input fields
    _nameController.clear();
    _descriptionController.clear();
    _instituteController.clear();
  }

  void _pushCourseNames() {
    final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref("Coursename");

  }

  var category = "Livestock Inspector Training";
  var _currentItemSelected = "Livestock Inspector Training";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Trainings and Courses"),
          toolbarHeight: 40,
          backgroundColor: Color(0xffa8e4a0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      body: SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:50,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Course Name',
                hintText: 'Enter the course name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: 4, // Allowing multiple lines for course description
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Course Description',
                hintText: 'Enter the course description',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (_nameController.text.isNotEmpty && _descriptionController.text.isNotEmpty && _currentItemSelected == 'Farmers Training')
              DropdownButtonFormField<String>(
                isDense:false,
                isExpanded: true,
                value: selectedInstitute,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                    BorderRadius.all(Radius.circular(4.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ഇൻസ്റ്റിറ്റ്യൂട്ടിൻ്റെ പേര് തിരഞ്ഞെടുക്കുക',
                ),
                onChanged: (String? newValue) {
                  print('New value selected: $newValue');
                  setState(() {
                    selectedInstitute = newValue;
                  });
                },
                items: instituteNames.map<DropdownMenuItem<String>>((String institute) {
                  return DropdownMenuItem<String>(
                    value: institute,
                    child: Text(institute),
                  );
                }).toList(),
          ),
            SizedBox(height: 20,),
            DropdownButtonFormField<String>(
              value: 'Livestock Inspector Training', // Replace with your category options
              onChanged: (value) {
                setState(() {
                  _currentItemSelected = value!;
                  category = value;
                });
              },
              items: <String>[
                'Farmers Training',
                'Livestock Inspector Training',
                'Officer Training',
                'Awareness Programme',
                'Course'
                // Add more categories as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _addCourse(category);
                // You can optionally show a success message or navigate to a different screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Course added successfully'),
                  ),
                );
              },
              child: Text('Add Course'),
            ),
            SizedBox(
              height:20,
            ),
          ],
        ),
      ),
            ),
    );
  }
}