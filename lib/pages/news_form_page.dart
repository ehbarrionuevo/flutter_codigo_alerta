import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/textfield_normal_widget.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({Key? key}) : super(key: key);

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Agregar noticia",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextFieldNormalWidget(
                hintText: "Título noticia",
                controller: titleController,
              ),
              divider20,
              TextFieldNormalWidget(
                hintText: "Link noticia",
                controller: titleController,
              ),
              divider20,
              ButtonNormalWidget(
                text: "Guardar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
