import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart' as gf;
import 'package:flutter/services.dart' show rootBundle;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';




class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late DatabaseReference dbRef;
  String? selectedFilter;
  List<Map<String, dynamic>> bookingList = [];
  List<String> instituteNames = [];
  List<String> courseNames = [];
  List<String> categoryNames = [];
  List<Map<String, dynamic>> backupBookingList = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('Booking');

    fetchData(); // Call method to fetch data initially
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
            'phoneNumber': value['phoneNumber'],
            'category': value['category'],
            'course': value['course'],
            'institute': value['institute'],
            'date': value['date'],
          });

          backupBookingList.add({
            'name': value['name'],
            'address': value['address'],
            'phoneNumber': value['phoneNumber'],
            'category': value['category'],
            'course': value['course'],
            'institute': value['institute'],
            'date': value['date'],
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa8e4a0),
        title: Text('Details'),
        actions: [
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
          rows: bookingList.map((booking) {
            return DataRow(cells: [
              DataCell(Text('${booking['name']}')),
              DataCell(Text('${booking['address']}')),
              DataCell(Text('${booking['phoneNumber']}')),
              DataCell(Text('${booking['category']}')),
              DataCell(Text('${booking['course']}')),
              DataCell(Text('${booking['institute']}')),
              DataCell(Text('${booking['date']}')),
            ]);
          }).toList(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('View Statistics'),
            ),
            ElevatedButton(
              onPressed: () {
                generatePDF();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Export'),
            )
          ],
        ),
      ),
    );
  }
  pw.Widget _buildTableCell(String text, {pw.TextStyle? style}) {
    return pw.Container(
      padding: pw.EdgeInsets.all(8),
      alignment: pw.Alignment.center,
      child: pw.Text(text, style: style),
    );
  }
  Future<void> generatePDF() async {
    // Create a PDF document
    final pdf = pw.Document();
    final MalayalamFont = await rootBundle.load("assets/fonts/NotoSansMalayalam-VariableFont_wdth,wght.ttf");
    final pw.Font MalayalamPWFont = pw.Font.ttf(MalayalamFont);
    // Add content to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          final List<pw.TableRow> tableRows = [];
          final headerStyle = pw.TextStyle(font: MalayalamPWFont, fontSize: 18, fontWeight: pw.FontWeight.bold);
          tableRows.add(
            pw.TableRow(
              children: [
                _buildTableCell('Name', style: headerStyle),
                _buildTableCell('Address', style: headerStyle),
                _buildTableCell('Phone Number', style: headerStyle),
                _buildTableCell('Category', style: headerStyle),
                _buildTableCell('Course', style: headerStyle),
                _buildTableCell('Institute', style: headerStyle),
                _buildTableCell('Date', style: headerStyle),
              ],
            ),
          );

          final dataStyle = pw.TextStyle(font: MalayalamPWFont, fontSize: 16);
          for(var booking in bookingList){
            tableRows.add(
              pw.TableRow(
                children: [
                  _buildTableCell('${booking['name']}', style: dataStyle),
                  _buildTableCell('${booking['address']}', style: dataStyle),
                  _buildTableCell('${booking['phoneNumber']}', style: dataStyle),
                  _buildTableCell('${booking['category']}', style: dataStyle),
                  _buildTableCell('${booking['course']}', style: dataStyle),
                  _buildTableCell('${booking['institute']}', style: dataStyle),
                  _buildTableCell('${booking['date']}', style: dataStyle),
                ],
              ),
            );
          }
          return pw.Table(children: tableRows);
        },
      ),
    );

    // Save the PDF document to a file
    final pdfData = await pdf.save();
    final directory = await getApplicationDocumentsDirectory();
    final pdfPath = '${directory.path}/booking_details.pdf';
    // Path to save the PDF

    final file = File(pdfPath);
    await file.writeAsBytes(pdfData);
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      queryParameters: {
        'subject': 'Sample PDF Attached',
        'body': 'This is a sample PDF attached.',
        'attachment': pdfPath,
        'to': 'devika.sg.kpz@gmail.com'// Specify the attachment path here
      },
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      // Launch the default email app with the pre-filled draft and attachment
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }

  }
}