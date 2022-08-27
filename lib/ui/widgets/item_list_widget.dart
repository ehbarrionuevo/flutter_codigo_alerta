import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class ItemListWidget extends StatelessWidget {
  String title;
  String subtitle;

  ItemListWidget({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: kFontPrimaryColor,
          child: Text(
            title[0],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
        ),
      ),
    );
  }
}
