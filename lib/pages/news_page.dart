
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/news_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

class NewsPage extends StatelessWidget {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Noticias",
        ),
      ),
      body: FutureBuilder(
        future: apiService.getNews(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<NewsModel> news = snap.data;
            return news.isNotEmpty
                ? ListView.builder(
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemListWidget(
                  title: news[index].titulo,
                  subtitle: news[index].fecha.toString(),
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
