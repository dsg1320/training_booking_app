import 'package:flutter/material.dart';
import 'package:training_booking/firebase_options.dart';
import 'package:training_booking/home_page.dart';
import 'package:training_booking/localnotification.dart';
import 'package:training_booking/utils.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
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
        backgroundColor: Color(0xffa4e299),
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}