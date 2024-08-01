import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AnotherPage extends StatelessWidget {
  final String payload;
  const AnotherPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmed"),
        backgroundColor: Color(0xffa8e4a0),),
      body: Center(child: Text(payload,
      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,
      ),
        textAlign: TextAlign.center,
      ),
      ),
    );
  }
}