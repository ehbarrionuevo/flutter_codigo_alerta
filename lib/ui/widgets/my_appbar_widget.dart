
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kFontPrimaryColor,
      ),
      title: Text(
        "Ciudadanos",
        style: TextStyle(
          color: kFontPrimaryColor,
        ),
      ),
    );
  }
}
