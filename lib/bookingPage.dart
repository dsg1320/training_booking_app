import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_booking/utils.dart';
import 'package:training_booking/bookingstore.dart';
import 'package:url_launcher/url_launcher.dart';


//import 'main.dart';
import 'mobileVerify.dart';

class Booking extends StatefulWidget {
  final String category;
  final String course;

  Booking({required this.category, required this.course});
  @override
  State<Booking> createState() => _BookingState();
}

bool isAdditionalFieldRequired(String course) {
  if (course == 'പശു പരിപാലനം ' ||
      course == 'എരുമ വളർത്തൽ' ||
      course == 'താറാവ്‌കോഴി വളർത്തൽ' ||
      course == 'പന്നി വളർത്തൽ' ||
      course == 'ഓമനമൃഗങ്ങളുടെ പരിപാലനം' ||
      course == 'മുയൽ വളർത്തൽ' ||
      course == 'ആട് വളർത്തൽ' ||
      course == 'പോത്ത് വളർത്തൽ')
  // || widget.course == 'Farmers Training' || widget.course == 'ആട് വളർത്തൽ');
  {
    return true;
  }
  return false;
}

class _BookingState extends State<Booking> {
  String dropdownValue = 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക';
  String dropdownValue1 = 'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?';
  String? genderValue;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final districtController = TextEditingController();
  final mailController = TextEditingController();
  final addressController = TextEditingController();
  final instituteController = TextEditingController();
  final animCountController = TextEditingController();
  final BookingDetails bookingDetails = BookingDetails();
  static const String googleFormLink = 'https://forms.gle/s7TaQJ9KVrjzhxF8A';

  late DatabaseReference dbRef;

  List<String> instituteNames = [
    'LMTC കുടപ്പനക്കുന്ന്,തിരുവനന്തപുരം',
    'LMTC കൊട്ടിയം, കൊല്ലം',
    'LMTC തലയോലപ്പറമ്പ്,കോട്ടയം',
    'LMTC വാഗമൺ, ഇടുക്കി',
    'LMTC ആലുവ എറണാകുളം',
    'LMTC മലമ്പുഴ, പാലക്കാട്',
    'LMTC ആദവനാട്, മലപ്പുറം',
    'LMTC മുണ്ടയാട്, കണ്ണൂർ',
    'LMTC സുൽത്താൻബത്തേരി, വയനാട്',
    // Add other institute names as needed
  ];
  bool showAdditionalField = false;
  String? selectedInstitute;
  Set<String> registeredInstitutes = {};
  @override
  void initState() {
    super.initState();
//dbRef = FirebaseDatabase.instance.ref().child('Booking');
    dbRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .ref("Booking");
    showAdditionalField = isAdditionalFieldRequired(widget.course);
    if(widget.category == 'Farmers Training'){
      loadRegisteredInstitutes(widget.course);
    }
  }

  Future <Set<String>> loadRegisteredInstitutes(String courseName) async{
    try{
      final DatabaseReference dRef = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
          'https://training-booking-app-default-rtdb.asia-southeast1.firebasedatabase.app/')
          .ref('Courses');
      final DatabaseEvent event = await dRef.child(widget.category)
          .orderByChild('name')
          .equalTo(courseName).once();

      if(event.snapshot.value!= null){
        Map<dynamic,dynamic> values = event.snapshot.value as Map<dynamic,dynamic>;

        values.forEach((key, value) {
          registeredInstitutes.add(value['institute']);
        });
      }
    } catch(e){
      print("Error Loading registered institutes: $e");
    }
    print("$registeredInstitutes");

    return registeredInstitutes;

  }

  @override
  Widget build(BuildContext context) {
    print('Widget rebuilt');
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa8e4a0),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.green),
        onPressed: () => Navigator.of(context).pop(),
      ),),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(

            // bookingpageYiu (68:20)
            padding:
                EdgeInsets.fromLTRB(16 * fem, 50.5 * fem, 10 * fem, 54 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffa8e4a0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 147 * fem, 70.5 * fem),
                  child: Text(
                    'ബുക്കിംഗ്',
                    style: safeGoogleFont(
                      'Inter',
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff243836),
                    ),
                  ),
                ),
                Container(
                  // frame59Cu (77:1217)
                  margin:
                      EdgeInsets.fromLTRB(7 * fem, 0 * fem, 10 * fem, 21 * fem),
                  width: 317 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                nameController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'പേര് ', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        height: 64 * fem,
                        child: Center(
                          child: TextField(
                            controller: ageController,
                            maxLength: 3,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'വയസ്സ്', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            // keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 55 * fem,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            value: genderValue,
                            hint: Text(
                              'ലിംഗം', // Placeholder when nothing is selected
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Inter',
                                fontSize: 15 * fem,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                genderValue = newValue;
                              });
                            },
                            items: <String>['പുരുഷൻ', 'സ്ത്രീ', 'മറ്റുള്ളവ']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                mailController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ഇ-മെയിൽ', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                                addressController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'വിലാസം', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          height: 44 * fem,
                          child: TextField(
                            controller:
                            districtController, //nameController.text=(has the input)
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ജില്ല', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * fem,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField<String>(
                          isDense:false,
                          isExpanded: true,
                          value: selectedInstitute,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ഇൻസ്റ്റിറ്റ്യൂട്ടിൻ്റെ പേര് തിരഞ്ഞെടുക്കുക',
                            ),
                            onChanged: (String? newValue) {
                              print('New value selected: $newValue');
                              setState(() {
                                    selectedInstitute = newValue;
                              });
                            },
                            items: (widget.category == 'Farmers Training')? registeredInstitutes.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                            : instituteNames.map<DropdownMenuItem<String>>((String institute) {
                                return DropdownMenuItem<String>(
                                  value: institute,
                                  child: Text(institute),
                                );
                               }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                          return 'Please select an institute';
                        }
                        return null;
                            },
                          ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      if (showAdditionalField)
                        Container(
                          color: Colors.red,
                          width: double.infinity,
                          child: Container(

                            height: 55 * fem,

                            child:
                                //if (widget.course == 'Cow management')
                                DropdownButtonFormField<String>(
                              value: dropdownValue1,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?',
                                  child: Text(
                                    'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?',
                                    style: TextStyle(
                                      color: dropdownValue1 ==
                                              'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?'
                                          ? Colors.grey
                                          : null,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '0',
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      color: dropdownValue1 == '0'
                                          ? Colors.black
                                          : null,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '1-5',
                                  child: Text('1-5'),
                                ),
                                DropdownMenuItem(
                                  value: '5-10',
                                  child: Text(
                                    '5-10',
                                    style: TextStyle(
                                      color: dropdownValue1 == '5-10'
                                          ? Colors.black
                                          : null,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '10-15',
                                  child: Text(
                                    '10-15',
                                    style: TextStyle(
                                      color: dropdownValue1 == '10-15'
                                          ? Colors.black
                                          : null,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '15-ലും കൂടുതൽ',
                                  child: Text(
                                    '15-ലും കൂടുതൽ',
                                    style: TextStyle(
                                      color: dropdownValue1 == '15-ലും കൂടുതൽ'
                                          ? Colors.black
                                          : null,
                                    ),
                                  ),
                                ),
                                // Add other DropdownMenuItem widgets
                              ],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                //hintText: 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14* fem,
                                fontWeight: FontWeight.w400,
                                color: dropdownValue != null
                                    ? Colors.black
                                    : Color(0xff252525),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.course == 'കാട വളർത്തൽ' ||
                    widget.course == 'ഓമനപ്പക്ഷി പരിപാലനം' ||
                    widget.course == 'താറാവ്‌  വളർത്തൽ' ||
                    widget.course == 'മുട്ടക്കോഴി വളർത്തൽ' ||
                    widget.course == 'ഇറച്ചിക്കോഴി വളർത്തൽ' ||
                    widget.course == 'ടർക്കി വളർത്തൽ')
                  Container(
                    width: double.infinity,
                    child: Container(
                      height: 55 * fem,
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue1,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?',
                            child: Text(
                              'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?',
                              style: TextStyle(
                                color: dropdownValue1 ==
                                        'എത്ര ഉരുക്കളെ പരിപാലിക്കുന്നുണ്ട്?'
                                    ? Colors.grey
                                    : null,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '0',
                            child: Text(
                              '0',
                              style: TextStyle(
                                color:
                                    dropdownValue1 == '0' ? Colors.black : null,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '1-100',
                            child: Text('1-100'),
                          ),
                          DropdownMenuItem(
                            value: '100-500',
                            child: Text(
                              '100-500',
                              style: TextStyle(
                                color: dropdownValue1 == '100-500'
                                    ? Colors.black
                                    : null,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '500-1000',
                            child: Text(
                              '500-1000',
                              style: TextStyle(
                                color: dropdownValue1 == '500-1000'
                                    ? Colors.black
                                    : null,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '1000-ൽ കൂടുതൽ',
                            child: Text(
                              '1000-ൽ കൂടുതൽ',
                              style: TextStyle(
                                color: dropdownValue1 == '1000-ൽ കൂടുതൽ'
                                    ? Colors.black
                                    : null,
                              ),
                            ),
                          ),
                          // Add other DropdownMenuItem widgets
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          //hintText: 'സ്ഥാപനം തിരഞ്ഞെടുക്കുക',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15 * fem,
                          fontWeight: FontWeight.w400,
                          color: dropdownValue1 != null
                              ? Colors.black
                              : Color(0xff252525),
                        ),
                      ),
                    ),
                  ),
                if(widget.category == 'Livestock Inspector Training')
                  Container(
                    width: double.infinity,
                    height: 40 * fem,
                    child: ElevatedButton(
                      onPressed: (){
                        launch(googleFormLink);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF243836),
                        alignment: Alignment.center,
                      ),
                      child: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'ഗൂഗിൾ ഫോം പൂരിപ്പിക്കുക',
                              style: safeGoogleFont(
                                'Montserrat',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175 *ffem/fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 30 * fem,
                ),
                Container(
                  width: double.infinity,
                  height: 40 * fem,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_validateForm()){
                        DateTime currentDate = DateTime.now();
                        String formattedDate =
                            '${currentDate.year}-${currentDate.month}-${currentDate.day}';
                        BookingDetails bookingDetails = BookingDetails();
                        bookingDetails.name = nameController.text;
                        bookingDetails.age = ageController.text;
                        bookingDetails.gender = genderValue ?? "";
                        bookingDetails.email = mailController.text;
                        bookingDetails.address = addressController.text;
                        bookingDetails.institute = selectedInstitute!;
                        bookingDetails.category = widget.category;
                        bookingDetails.course = widget.course;
                        bookingDetails.date = formattedDate;
                        bookingDetails.animCount = animCountController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  phnNum(bookingDetails: bookingDetails)),
                        );
                      }

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF243836), alignment: Alignment.center
                        //height: 1.2125 * ffem / fem,
                        ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'അടുത്തത്\n\n',
                            //textAlign: TextAlign.end,
                            style: safeGoogleFont(
                              'Montserrat',
                              fontSize: 17 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //);
  }
  bool _validateForm() {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        genderValue == null || genderValue!.isEmpty ||
        mailController.text.isEmpty ||
        addressController.text.isEmpty ||
        districtController.text.isEmpty ||
        selectedInstitute == null) {
      // Show an error message or dialog informing the user to fill all fields.
      // For example:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }
}
