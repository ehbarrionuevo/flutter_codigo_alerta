
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  const TextFieldPasswordWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldPasswordWidget> createState() => _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: kFontPrimaryColor.withOpacity(0.50),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
