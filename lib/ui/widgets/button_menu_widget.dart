import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

class ButtonMenuWidget extends StatelessWidget {
  Function onTap;
  IconData iconData;

  ButtonMenuWidget({
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kFontPrimaryColor,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
