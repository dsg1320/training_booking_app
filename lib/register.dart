import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:training_booking_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'model.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
  new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  final TextEditingController instituteNameController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Admin',
    'Institute',
  ];
  var _currentItemSelected = "Institute";
  var rool = "Institute";

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

  String? selectedInstitute;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color(0xffa4e299),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(47*fem, 0*fem, 0*fem, 0*fem),
              width: 449*fem,
              height: 370*fem,
              child: Stack(
                children: [
                  Positioned(
                    // images2tc1 (90:2209)
                    left: 20*fem,
                    top: 100.5*fem,
                    child: Align(
                      child: SizedBox(
                        width: 237.27*fem,
                        height: 250*fem,
                        child: Image.asset(
                          'assets/images-1-TWy-removebg-preview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color:Color(0xffa4e299) ,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedInstitute,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Institute Name',
                            hintText: 'Select institute name',
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedInstitute = newValue;
                            });
                          },
                          items: instituteNames.map((String institute) {
                            return DropdownMenuItem<String>(
                              value: institute,
                              child: Text(institute),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select an institute';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter valid email id as abc@gmail.com'),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter secure password'
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: 'Enter secure password'
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Role : ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.green[900],
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  rool = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginpage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              color: Colors.green,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                setState(() {
                                  showProgress = true;
                                });
                                signUp(emailController.text,
                                    passwordController.text, rool);
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              color: Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
    );
  }

  void signUp(String email, String password, String rool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool, selectedInstitute!)})
          .catchError((e) {});
    }
  }

  Future<void> postDetailsToFirestore(String email, String rool, String instituteName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;

    // Update the user's display name with the institute name
    try {
      await user!.updateDisplayName(instituteName);
      print('Display name updated to: $instituteName');
    } catch (e) {
      print('Error updating display name: $e');
      // Handle error setting display name
    }

    // Store other details in Firestore
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'instituteName': instituteName,
    }).then((_) {
      // Navigate to the login page after details are stored
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    }).catchError((error) {
      print('Error storing details: $error');
      // Handle error storing details
    });
  }
}