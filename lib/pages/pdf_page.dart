
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({Key? key}) : super(key: key);

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
            onPressed: (){

            },
            text: "Generar PDF",
          ),
        ),
      ),
    );
  }
}
