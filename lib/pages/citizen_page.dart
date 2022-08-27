import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/citizen_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class CitizenPage extends StatefulWidget {
  const CitizenPage({Key? key}) : super(key: key);

  @override
  State<CitizenPage> createState() => _CitizenPageState();
}

class _CitizenPageState extends State<CitizenPage> {
  APIService apiService = APIService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: FutureBuilder(
        future: apiService.getCitizens(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<CitizenModel> citizens = snap.data;
            return ListView.builder(
              itemCount: citizens.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kFontPrimaryColor,
                    child: Text(
                      citizens[index].nombreCompleto[0],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(citizens[index].nombreCompleto),
                  subtitle: Text(citizens[index].telefono),
                );
              },
            );
          }
          return Text("Hola");
        },
      ),
    );
  }
}
