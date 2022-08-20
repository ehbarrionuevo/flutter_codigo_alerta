
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/pages/home_page.dart';
import 'package:flutter_codigo_alerta/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alerta App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: LoginPage(),
    );
  }
}
