

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:path_provider/path_provider.dart';

class ExcelPage extends StatelessWidget {

  saveExcel()async {
    Excel excel = Excel.createExcel();
    Sheet? sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1)).value = "Hola";
    List<int>? bytes = excel.save();
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
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
