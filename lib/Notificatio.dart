import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AnotherPage extends StatelessWidget {
  final String payload;
  const AnotherPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmed")),
      body: Center(child: Text(payload)),
    );
  }
}