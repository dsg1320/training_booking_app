import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class BookingDetails {
  String name = '';
  String age = '';
  String gender = '';
  String email = '';
  String address = '';
  String district = '';
  String institute = '';
  String phoneNumber = '';
  String category = ''; // Add category field
  String course = '';
  String date = '';
  String animCount = '';
  bool completed = false;
  late DatabaseReference reference;
  Future<void> saveDataToDatabase() async {
    reference = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .ref("Booking");
    String uniqueId = Uuid().v4();

    Map<String, dynamic> bookingData = {
      'uniqueIdentifier': uniqueId,
      'name': name,
      'age': age,
      'gender': gender,
      'email': email,
      'address': address,
      'district':district,
      'institute': institute,
      'phoneNumber': phoneNumber,
      'category': category,
      'course': course,
      'date': date,
      'completed': false
    };

    try {
      await reference.child(uniqueId).set(bookingData);
    } catch (error) {
      print("Failed to store data: $error");
    }
  }
}
