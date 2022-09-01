import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/helpers/sp_global.dart';
import 'package:flutter_codigo_alerta/pages/home_page.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/textfield_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SPGlobal spGlobal = SPGlobal();

  void _login() {
    if (_formKey.currentState!.validate()) {
      APIService apiService = APIService();

      String username = dniController.text;
      String pwd = passwordController.text;
      apiService.login(username, pwd).then((value) {
        if (value != null) {
          spGlobal.isLogin = true;
          spGlobal.token = value.token!;
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePage()), (route) => false);
        } else {
          showSnackBarError(context, "Credenciales incorrectas");
        }
      }).catchError((error) {
        showSnackBarError(context, error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://images.pexels.com/photos/889545/pexels-photo-889545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
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
                        TextFieldNormalWidget(
                          hintText: "DNI",
                          controller: dniController,
                        ),
                        divider20,
                        TextFieldPasswordWidget(
                          controller: passwordController,
                        ),
                        divider30,
                        ButtonNormalWidget(
                          text: "Iniciar Sesión",
                          onPressed: () {
                            _login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
