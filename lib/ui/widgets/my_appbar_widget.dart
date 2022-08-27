
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class MyAppBar extends StatelessWidget {

  String title;

  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kFontPrimaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kFontPrimaryColor,
        ),
      ),
    );
  }
}
