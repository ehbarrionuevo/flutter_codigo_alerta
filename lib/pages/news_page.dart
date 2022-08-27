import 'package:cached_network_image/cached_network_image.dart';
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
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        width: double.infinity,
                        height: 240.0,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: CachedNetworkImage(
                                width: double.infinity,
                                height: 240.0,
                                imageUrl:
                                    "https://images.pexels.com/photos/12791156/pexels-photo-12791156.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => loadingWidget(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Positioned.fill(
                              bottom: -40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87.withOpacity(0.05),
                                        offset: const Offset(0, 5),
                                        blurRadius: 12.0
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
