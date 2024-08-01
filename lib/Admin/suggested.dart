import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';



class Suggested extends StatefulWidget {
  @override
  _SuggestedTraining createState() => _SuggestedTraining();
}

class _SuggestedTraining extends State<Suggested> {
  late DatabaseReference dbRef;
  late StreamSubscription<DatabaseEvent> _subscription;
  List<Map<dynamic, dynamic>> suggestedTrainingsList = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('suggestedTrainings');
    _subscription = dbRef.onValue.listen((event) {
      if (event.snapshot.value != null){
        DataSnapshot snapshot = event.snapshot;
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        suggestedTrainingsList.clear();
        values.forEach((key, value) {
          suggestedTrainingsList.add(value);
        });
        setState(() {});
      }
    });
  }
  @override
  void dispose() {
    _subscription?.cancel(); // Cancel the listener when the widget is disposed of
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggested Trainings'),
        backgroundColor: Color(0xffa8e4a0),
      ),
      body: suggestedTrainingsList.isEmpty
          ? Center(child: Text('No suggested trainings available'))
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Chosen Category')),
            DataColumn(label: Text('Suggested Training')),
            DataColumn(label: Text('Institute Recommended')),
          ],
          rows: suggestedTrainingsList.map((training) {
            return DataRow(
              cells: [
                DataCell(Text(training['chosenCategory'] ?? '')),
                DataCell(Text(training['suggestedTraining'] ?? '')),
                DataCell(Text(training['Institute'] ?? '')),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
