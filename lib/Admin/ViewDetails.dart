import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
//import 'package:training_booking/Admin/invoice_service.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:training_booking/Admin/mobile.dart';
import 'dart:typed_data';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late DatabaseReference dbRef;
  Set<int> selectedRows = Set<int>();
  String? selectedFilter;
  List<Map<String, dynamic>> bookingList = [];
  List<String> instituteNames = [];
  List<String> courseNames = [];
  List<String> categoryNames = [];
  List<Map<String, dynamic>> backupBookingList = [];
  late StreamSubscription<DatabaseEvent> _subscription;
  //final PdfInvoiceService service = PdfInvoiceService();
  int number=0;

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
    dbRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
        event.snapshot.value as Map<dynamic, dynamic>;

        bookingList.clear(); // Clear existing list before updating
        instituteNames.clear();
        courseNames.clear();
        categoryNames.clear();

        values.forEach((key, value) {
          bookingList.add({
            'name': value['name'],
            'address': value['address'],
            'district': value['district'],
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
            'district': value['district'],
            'phoneNumber': value['phoneNumber'],
            'category': value['category'],
            'course': value['course'],
            'institute': value['institute'],
            'date': value['date'],
            'uniqueIdentifier': value['uniqueIdentifier'],
            'completed': value['completed'],

            // Add other fields as needed
          });

          // Get distinct institute names
          if (!instituteNames.contains(value['institute'])) {
            instituteNames.add(value['institute']);
          }

          // Get distinct course names
          if (!courseNames.contains(value['course'])) {
            courseNames.add(value['course']);
          }

          // Get distinct category names
          if (!categoryNames.contains(value['category'])) {
            categoryNames.add(value['category']);
          }
        });

        // Set state after fetching data to trigger rebuild with fetched data
        setState(() {});
      }
    });
  }

  // Method to filter data based on selected criteria
  void filterData(String? filterOption) {
    setState(() {
      selectedFilter = filterOption;

      if (selectedFilter == 'Institute') {
        _showFilterOptions(instituteNames, 'Select Institute');
      } else if (selectedFilter == 'Course') {
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
                      if (selectedFilter == 'Institute') {
                        bookingList.retainWhere((e) =>
                        e['institute'] == option);
                      } else if (selectedFilter == 'Course') {
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
    int totalRows = bookingList.length;
    int completedRows = bookingList.where((booking) => booking['completed'] == true).length;
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
                value: 'Institute',
                child: Text('Institute Name'),
              ),
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
        child: Column(
          children: [
            SingleChildScrollView(
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
            SizedBox(
              height: 70,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(
                'Total Participants: $totalRows, Completed: $completedRows',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){_createPdf(bookingList);},
              child: Text('Export'),
            ),
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
  Future<void> _createPdf(List<Map<String, dynamic>> bookingList) async {
    int totalRows = bookingList.length;
    int completedRows = bookingList.where((booking) => booking['completed'] == true).length;
    // Create a new PDF document
    final ByteData fontData = await rootBundle.load('assets/fonts/NotoSansMalayalam-VariableFont_wdth,wght.ttf');
    final Uint8List fontBytes = fontData.buffer.asUint8List();
    final double fontSize = 12.0;
    final PdfFont malayalamFont = PdfTrueTypeFont(fontBytes,fontSize);

    PdfDocument document = PdfDocument();

    // Add a new page to the document
    final page = document.pages.add();

    // Define headers for the table
    List<String> headers = [
      'name',
      'phoneNumber',
      'address',
      'category',
      'institute',
      'course',
      'date',
      'completed',
    ];

    List<Map<String,dynamic>> updateBookingList = bookingList.map((booking){
      return {
        ...booking,
        'completed': booking['completed']? 'Yes' : 'No',
      };
    }).toList();

    PdfFont headingFont = PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold);
    page.graphics.drawString('Livestock Management and Training Centre', headingFont, bounds: Rect.fromLTWH(0, 50, page.getClientSize().width, 20), format: PdfStringFormat(alignment: PdfTextAlignment.center));

    PdfFont subheadingFont = PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold);
    page.graphics.drawString('Training Details Report', subheadingFont, bounds: Rect.fromLTWH(0, 80, page.getClientSize().width, 20), format: PdfStringFormat(alignment: PdfTextAlignment.center));

    // Create and initialize the PDF grid
    PdfGrid grid = PdfGrid();
    grid.columns.add(count: headers.length);

    // Add headers to the grid
    for (var header in headers) {
      grid.headers.add(1);
      grid.headers[0].cells[headers.indexOf(header)].value = header;
    }

    // Add data to the grid from bookingList
    for (var bookingData in updateBookingList) {
      PdfGridRow gridRow = grid.rows.add();
      for (var header in headers) {
        if (header == 'course' || header == 'institute') {
          // Use Malayalam font for course and institute fields
           // Adjust alignment as needed
          gridRow.cells[headers.indexOf(header)].value = PdfTextElement(
            text: bookingData[header],
            font: malayalamFont,
          );
        } else{
          gridRow.cells[headers.indexOf(header)].value = bookingData[header];
        }

      }
    }

    /*for (var bookingData in bookingList) {
      PdfGridRow gridRow = grid.rows.add();
      for (var header in headers) {
        // Convert boolean values to strings before assigning
        var cellValue = header == 'completed' ? bookingData[header].toString() : bookingData[header];
        gridRow.cells[headers.indexOf(header)].value = cellValue;
      }
    }*/
    double cellHeight = 20.0; // Change this value based on your cell height
    double gridHeight = grid.rows.count * cellHeight;

    // Draw the grid on the PDF page
    PdfLayoutResult? gridResult = grid.draw(
      page: page,
      bounds: Rect.fromLTWH(0, (page.getClientSize().height - gridHeight) / 2, page.getClientSize().width, 0),
    );
    // Display total rows and completed rows at the bottom
    PdfFont totalRowsFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
    page.graphics.drawString('Total Participants: $totalRows, Completed Participants: $completedRows', totalRowsFont, bounds: Rect.fromLTWH(0, 230, page.getClientSize().width, 20), format: PdfStringFormat(alignment: PdfTextAlignment.left));

    PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
    DateTime currentDate = DateTime.now();
    page.graphics.drawString('Generated on: ${currentDate.toLocal()}',
        dateFont, bounds: Rect.fromLTWH(0, page.getClientSize().height - 30, page.getClientSize().width, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.center));

    // Save the document as bytes
    List<int> bytes = await document.save();

    // Dispose the document
    document.dispose();

    // Save and launch the PDF file
    saveAndLaunchFile(bytes, 'Training_Details.pdf');
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