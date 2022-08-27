
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/news_model.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemNewsWidget extends StatelessWidget {

  NewsModel newsModel;
  ItemNewsWidget({required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 40,
        top: 20,
        right: 14,
        left: 14,
      ),
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
              imageUrl: newsModel.imagen,
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
            bottom: -32,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                margin: const EdgeInsets.symmetric(
                    horizontal: 26.0),
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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      newsModel.fecha.toString().substring(0,10),
                      style: TextStyle(
                        color: kFontPrimaryColor
                            .withOpacity(0.75),
                        fontSize: 12.0,
                      ),
                    ),
                    divider3,
                    Text(
                      newsModel.titulo,
                      maxLines: 3,
                      style: TextStyle(
                        color: kFontPrimaryColor
                            .withOpacity(0.85),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: (){
                Uri url = Uri.parse(newsModel.link);
                launchUrl(url);
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.50),
                ),
                child: Icon(
                  Icons.link,
                  color: kFontPrimaryColor.withOpacity(0.75),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
