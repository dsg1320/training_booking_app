import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking_app/Admin/AdminHome.dart';
import 'package:training_booking_app/categories.dart';
import 'package:training_booking_app/institutions.dart';
import 'package:training_booking_app/register.dart';
import 'package:training_booking_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}
class _LoginpageState extends State<Loginpage>{
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
    Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        
      body: SingleChildScrollView(
       child: Container(
       width: double.infinity,
        child: Container(
        // adminloginUFT (66:4)
        padding: EdgeInsets.fromLTRB(36*fem, 0*fem, 0*fem, 35*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffa4e299),
          borderRadius: BorderRadius.circular(2*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupsnmfLgy (Lu1gzhPyToKv9P2M4oSNMF)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
              width: 449*fem,
              height: 491.5*fem,
              child: Stack(
                children: [
                  Positioned(
                    // r9X (66:8)
                    left: 3*fem,
                    top: 100*fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 278*fem,
                          height: 117*fem,
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
                    ),
                  ),
                  Positioned(
                    // images2tc1 (90:2209)
                    left: 20*fem,
                    top: 240.5*fem,
                    child: Align(
                      child: SizedBox(
                        width: 237.27*fem,
                        height: 240*fem,
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
         Form(
           key:_formkey,
           child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(left:0.0,right: 15.0,top:0,bottom: 0),
               //padding: EdgeInsets.symmetric(horizontal: 15),
               child: TextFormField(
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
                 onSaved: (value) {
                   emailController.text = value!;
                 },
                 keyboardType: TextInputType.emailAddress,
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(
                   left: 0.0, right: 15.0, top: 7, bottom: 0),
               //padding: EdgeInsets.symmetric(horizontal: 15),
               child: TextFormField(
                 controller: passwordController,
                 obscureText: _isObscure3,
                 decoration: InputDecoration(
                     suffixIcon: IconButton(
                         icon: Icon(_isObscure3
                             ? Icons.visibility
                             : Icons.visibility_off),
                         onPressed: () {
                           setState(() {
                             _isObscure3 = !_isObscure3;
                           });
                         }),
                     border: OutlineInputBorder(),
                     labelText: 'Password',
                     hintText: 'Enter secure password'),
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
                 onSaved: (value) {
                   passwordController.text = value!;
                 },
                 keyboardType: TextInputType.emailAddress,
               ),
             ),
             TextButton(
               onPressed: (){
                 //TODO FORGOT PASSWORD SCREEN GOES HERE
               },
               child: Text(
                 'Forgot Password',
                 style: TextStyle(color: Colors.black, fontSize: 15),
               ),
             ),
             Container(
               height: 50,
               width: 250,
               decoration: BoxDecoration(
                   color: Colors.green, borderRadius: BorderRadius.circular(20)),
               child: TextButton(
                 onPressed: () {
                   setState(() {
                     visible = true;
                   });
                   signIn(
                       emailController.text, passwordController.text);
                 },
                 child: Text(
                   'Login',
                   style: TextStyle(color: Colors.white, fontSize: 25),
                 ),
               ),
             ),
           ],
         ),
       ),
            SizedBox(
              height: 5,
            ),
           
          ],
        ),
      ),
    ),
    ),
    );
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Institute") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  Scene3(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  Admin(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          // User is signed in, navigate to the next screen
          route();
        } else {
          // Handle unexpected case where userCredential.user is null
          print('Sign-in was not successful.');}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}