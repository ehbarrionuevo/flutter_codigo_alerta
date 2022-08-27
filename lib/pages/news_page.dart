import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/news_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
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
                          color: Colors.white,
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
                                    "http://alertahunter.herokuapp.com/media/Noticias/image_picker1822915258180595565_compressed7606707498878403981.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => loadingWidget(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/error.jpg',
                                      fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: -40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 14.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 26.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black87.withOpacity(0.05),
                                          offset: const Offset(0, 5),
                                          blurRadius: 12.0),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "12/12/2022",
                                        style: TextStyle(
                                          color: kFontPrimaryColor.withOpacity(0.75),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      divider3,
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                        style: TextStyle(
                                          color: kFontPrimaryColor.withOpacity(0.85),
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
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
