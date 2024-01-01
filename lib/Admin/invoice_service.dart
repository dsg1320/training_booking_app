import 'package:open_document/my_files/init.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class PdfInvoiceService{
  Future<Uint8List> createInvoice(){
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context){
          return pw.Center(child: pw.Text("Hello World"));
        },
      ),
    );
    return pdf.save();
  }

  Future<void> savePdfFile(String filename, Uint8List byteList)async{
    final output = await getTemporaryDirectory();
    var filepath = "${output.path}/$filename.pdf";
    final file = File(filepath);
    await file.writeAsBytes(byteList);
    await OpenDocument.openDocument(filePath: filepath);
  }
}


