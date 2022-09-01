import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPage extends StatelessWidget {
  savePdf() async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      // pw.Page(
      //   pageFormat: PdfPageFormat.a4,
      //   build: (pw.Context context){
      //     return pw.Text("Hola");
      //   }
      // ),
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Row(
              children: [
                pw.Column(
                  children: [
                    pw.Text("Elemento: 1",),
                    pw.Text("Elemento: 1",),
                    pw.Text("Elemento: 1",),
                    pw.Text("Elemento: 1",),
                  ]
                ),
              ],
            ),
            pw.Divider(),
            pw.ListView(
              children: List.generate(
                200,
                (index) => pw.Container(
                  child: pw.Text(
                    "Hola",
                  ),
                ),
              ),
            ),
          ];
        },
      ),
    );
    Uint8List bytes = await pdf.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File filePdf = File("${directory.path}/alerta.pdf");
    filePdf.writeAsBytes(bytes);
    OpenFile.open(filePdf.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "PDF",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonNormalWidget(
            onPressed: () {
              savePdf();
            },
            text: "Generar PDF",
          ),
        ),
      ),
    );
  }
}
