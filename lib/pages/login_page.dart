import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://images.pexels.com/photos/889545/pexels-photo-889545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Alerta Municipio",
                      style: TextStyle(
                        color: kFontPrimaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    divider6,
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        color: kFontPrimaryColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    divider6,
                    Text(
                      "Ingresa tus credenciales en los siguientes campos",
                      style: TextStyle(
                        color: kFontPrimaryColor.withOpacity(0.85),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    divider20,
                    TextField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
