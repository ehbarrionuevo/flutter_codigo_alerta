import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/textfield_normal_widget.dart';
import 'package:image_picker/image_picker.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({Key? key}) : super(key: key);

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {

  XFile? imageSource;
  final TextEditingController titleController = TextEditingController();


  getImageGallery() async {
    ImagePicker _imagePicker = ImagePicker();
    imageSource = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState((){});
  }

  getImageCamera() async {
    ImagePicker _imagePicker = ImagePicker();
    imageSource = await _imagePicker.pickImage(source: ImageSource.camera);
    setState((){});
  }

  saveNews(){
    APIService apiService = APIService();
    apiService.registerNews(File(imageSource!.path));
  }


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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Divider(),
              Text(
                "Seleccionar imagen",
              ),
              divider12,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        getImageGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: Icon(Icons.image),
                      label: const Text(
                        "Galería",
                      ),
                    ),
                  ),
                  divider10Width,
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        getImageCamera();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF6AA26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: Icon(Icons.camera_alt),
                      label: const Text(
                        "Cámara",
                      ),
                    ),
                  ),
                ],
              ),
              divider20,
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image(
                  image: imageSource != null ? FileImage(File(imageSource!.path)) : AssetImage("assets/images/error.jpg") as ImageProvider,
                  width: double.infinity,
                  height: 280.0,
                  fit: BoxFit.cover,
                ),
              ),
              divider30,
              ButtonNormalWidget(
                text: "Guardar",
                onPressed: () {
                  saveNews();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
