
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Noticias",
        ),
      ),
    );
  }
}
