import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';





class InstitutePage extends StatefulWidget {
  @override
  _InstitutePageState createState() => _InstitutePageState();
}

class _InstitutePageState extends State<InstitutePage> {
  late DatabaseReference dbRef;
  Set<int> selectedRows = Set<int>();
  String? selectedFilter;
  List<Map<String, dynamic>> bookingList = [];
  List<String> courseNames = [];
  List<String> categoryNames = [];
  List<Map<String, dynamic>> backupBookingList = [];
  late StreamSubscription<DatabaseEvent> _subscription;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Booking');
    _subscription = dbRef.onValue.listen((event) {
      if (event.snapshot.value != null){
        DataSnapshot snapshot = event.snapshot;
        fetchData();
      }
    });// Call method to fetch data initially
  }
  @override
  void dispose() {
    _subscription?.cancel(); // Cancel the listener when the widget is disposed of
    super.dispose();
  }
  // Method to fetch data from Firebase
  void fetchData() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null){
      String loggedInInstituteName = user.displayName ?? '';
      print(loggedInInstituteName);
      dbRef.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;

          bookingList.clear(); // Clear existing list before updating
          courseNames.clear();
          categoryNames.clear();

          values.forEach((key, value) {
            if (value['institute'] == loggedInInstituteName){
              bookingList.add({
                'name': value['name'],
                'address': value['address'],
                'phoneNumber': value['phoneNumber'],
                'category': value['category'],
                'course': value['course'],
                'institute': value['institute'],
                'date': value['date'],
                'uniqueIdentifier': value['uniqueIdentifier'],
                'completed': value['completed'],
              });

              backupBookingList.add({
                'name': value['name'],
                'address': value['address'],
                'phoneNumber': value['phoneNumber'],
                'category': value['category'],
                'course': value['course'],
                'institute': value['institute'],
                'date': value['date'],
                'uniqueIdentifier': value['uniqueIdentifier'],
                'completed': value['completed'],

                // Add other fields as needed
              });

              // Get distinct course names
              if (!courseNames.contains(value['course'])) {
                courseNames.add(value['course']);
              }

              // Get distinct category names
              if (!categoryNames.contains(value['category'])) {
                categoryNames.add(value['category']);
              }
          }
              });

          // Set state after fetching data to trigger rebuild with fetched data
          setState(() {});
        }
      });
  }
  }

  // Method to filter data based on selected criteria
  void filterData(String? filterOption) {
    setState(() {
      selectedFilter = filterOption;

      if (selectedFilter == 'Course') {
        _showFilterOptions(courseNames, 'Select Course');
      } else if (selectedFilter == 'Category') {
        _showFilterOptions(categoryNames, 'Select Category');
      } else {
        // If no filter is selected, display all details
        bookingList = List.from(backupBookingList);
      }
    });
  }

  // Show filter options based on selected filter
  void _showFilterOptions(List<String> optionsList, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: optionsList.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      bookingList = List.from(backupBookingList);
                      //bookingList = []; // Clear the list before filtering
                      if (selectedFilter == 'Course') {
                        bookingList.retainWhere((e) => e['course'] == option);
                      } else if (selectedFilter == 'Category') {
                        bookingList.retainWhere((e) => e['category'] == option);
                      }
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
  bool showSaveButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa8e4a0),
        title: Text('Details'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              showSaveButton = true;
            });
          }, icon: Icon(Icons.check)),
          PopupMenuButton<String>(
            onSelected: filterData,
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Course',
                child: Text('Course Name'),
              ),
              PopupMenuItem<String>(
                value: 'Category',
                child: Text('Category Name'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Phone Number')),
            DataColumn(label: Text('Category')),
            DataColumn(label: Text('Course')),
            DataColumn(label: Text('Institute')),
            DataColumn(label: Text('Date')),
          ],
          rows: bookingList.asMap().entries.map((entry) {
            final index = entry.key;
            final booking = entry.value;
            final isSelected = selectedRows.contains(index);
            bool isCompleted() {
              return booking['completed'] == true;
            }
            return DataRow(
              selected: isSelected,
              onSelectChanged: (_){
                if(isSelected){
                  setState(() {
                    selectedRows.remove(index);
                  });
                }else{
                  setState(() {
                    selectedRows.add(index);
                  });
                }
              },

              cells: [
                DataCell(Text('${booking['name']}')),
                DataCell(Text('${booking['address']}')),
                DataCell(Text('${booking['phoneNumber']}')),
                DataCell(Text('${booking['category']}')),
                DataCell(Text('${booking['course']}')),
                DataCell(Text('${booking['institute']}')),
                DataCell(Text('${booking['date']}')),
              ],
              color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states){
                if (states.contains(MaterialState.selected)) {
                  return null;
                }
                return isCompleted() ? Colors.lightGreen[50] : null;
              }),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                deleteSelectedRows();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Delete'),
            ),
            if (showSaveButton) // Conditionally include the "Save" button
              ElevatedButton(
                onPressed: () {
                  // Logic for "Save" button
                  saveMarkedRows();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Change color to your preference
                ),
                child: Text('Save'),
              ),
          ],
        ),
      ),
    );
  }

  void saveMarkedRows() {
    int countCompleted = 0;
    // Logic to save marked rows as completed
    for (int index in selectedRows) {
      bookingList[index]['completed'] = true;
      String? key = bookingList[index]['uniqueIdentifier'] as String?;
      if (key != null) {
        dbRef.child(key).update({
          'completed': true,
        }).then((_) {
          countCompleted++;
          print('Individual marked as completed with key: $key');
        }).catchError((error) {
          print('Error updating completion status: $error');
          // Handle error if updating fails
        });
      }
    }
    print('Number of individuals who finished training: $countCompleted');
    setState(() {
      showSaveButton = false; // Hide the "Save" button
      selectedRows.clear(); // Clear selected rows after saving
    });
  }
  // Function to delete selected rows
  void deleteSelectedRows() {
    List<int> selectedIndices = selectedRows.toList();
    print(selectedIndices);
    selectedIndices.sort((a, b) => b.compareTo(a));

    for (int index in selectedIndices) {
      String? key = bookingList[index]['uniqueIdentifier'] as String?;

      if (key != null) {
        dbRef.child(key).remove().then((_) {
          setState(() {
            bookingList.removeAt(index);
            backupBookingList.removeAt(index);
            selectedRows.remove(index);
          });
        }).catchError((error) {
          print('Error: $error');
          // Handle error if deletion fails
        });
      } else {
        print('Error: The key is null or not found for index $index');
      }
    }
  }


}