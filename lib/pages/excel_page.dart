

import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelPage extends StatelessWidget {

  List<IncidentModel> incidents;
  ExcelPage({required this.incidents});


  saveExcel()async {
    Excel excel = Excel.createExcel();
    Sheet? sheet = excel.sheets[excel.getDefaultSheet() as String];


    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value = "ID";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value = "Tipo de Incidente";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value = "Fecha";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value = "Hora";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)).value = "Latitud";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)).value = "Longitud";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value = "Ciudadano";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0)).value = "DNI";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 0)).value = "Teléfono";

    for(int index = 1; index < incidents.length; index++){
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index)).value = incidents[index].id;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: index)).value = incidents[index].tipoIncidente.titulo;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: index)).value = incidents[index].fecha;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: index)).value = incidents[index].hora;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: index)).value = incidents[index].latitud;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: index)).value = incidents[index].longitud;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: index)).value = incidents[index].datosCiudadano.nombres;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: index)).value = incidents[index].datosCiudadano.dni;
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: index)).value = incidents[index].datosCiudadano.telefono;
    }

    List<int>? bytes = excel.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File fileExcel = File("${directory.path}/excel_alerta.xlsx");
    fileExcel.createSync(recursive: false);
    fileExcel.writeAsBytesSync(bytes!);
    OpenFile.open(fileExcel.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Excel",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonNormalWidget(
            onPressed: (){
              saveExcel();
            },
            text: "Generar Excel",
          ),
        ),
      ),
    );
  }
}
