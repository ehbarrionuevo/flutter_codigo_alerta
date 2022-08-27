import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/citizen_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Ciudadanos",
        ),
      ),
      body: FutureBuilder(
        future: apiService.getCitizens(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<CitizenModel> citizens = snap.data;
            return citizens.isNotEmpty
                ? ListView.builder(
                    itemCount: citizens.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemListWidget(
                        title: citizens[index].nombreCompleto,
                        subtitle: citizens[index].telefono,
                      );
                    },
                  )
                : emptyDataWidget();
          }
          return loadingWidget();
        },
      ),
    );
  }
}
