import 'package:flutter/material.dart';
import 'package:training_booking_app/bookingPage.dart';
import 'package:training_booking_app/firebase_options.dart';
import 'package:training_booking_app/home_page.dart';
import 'package:training_booking_app/institutesignin.dart';
import 'package:training_booking_app/mobileVerify.dart';
import 'package:training_booking_app/otp.dart';
import 'package:training_booking_app/register.dart';
import 'package:training_booking_app/utils.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}