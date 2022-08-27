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
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        width: double.infinity,
                        height: 260.0,
                        child: CachedNetworkImage(
                          imageUrl: "https://images.pexels.com/photos/12791156/pexels-photo-12791156.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        // child: Image.network(
                        //   "http://alertahunter.herokuapp.com/media/Noticias/image_picker1822915258180595565_compressed7606707498878403981.jpg",
                        //   errorBuilder: (context, error, stackTrace){
                        //     return Image.asset('assets/images/box.png');
                        //   },
                        // ),

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
