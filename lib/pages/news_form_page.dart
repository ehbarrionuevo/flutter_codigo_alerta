import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/news_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/textfield_normal_widget.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({Key? key}) : super(key: key);

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  XFile? imageSource;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  getImageGallery() async {
    ImagePicker _imagePicker = ImagePicker();
    imageSource = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  getImageCamera() async {
    ImagePicker _imagePicker = ImagePicker();
    imageSource = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  saveNews() async {
    APIService apiService = APIService();

    NewsModel newsModel = NewsModel(
      id: 0,
      link: linkController.text,
      titulo: titleController.text,
      fecha: DateTime.now(),
      imagen: "",
    );

    print(DateTime.now());
    final DateFormat formatter = DateFormat('dd-MMMM-yyyy');
    final String formatted = formatter.format(DateTime.now());
    print(formatted);

    // File file = File(imageSource!.path);
    // File compressedFile =
    //     await FlutterNativeImage.compressImage(file.path, quality: 80);
    // apiService.registerNews(File(compressedFile.path));
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
                  image: imageSource != null
                      ? FileImage(File(imageSource!.path))
                      : AssetImage("assets/images/error.jpg") as ImageProvider,
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
