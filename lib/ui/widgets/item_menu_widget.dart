
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class ItemMenuWidget extends StatelessWidget {
  const ItemMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(4, 4),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(4, 4),
                    blurRadius: 10.0),
              ],
            ),
            child: Image.asset(
              'assets/images/man.png',
              height: 60,
            ),
          ),
          divider6,
          Text(
            "Ciudadanos",
            style: TextStyle(
              color: kFontPrimaryColor,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
