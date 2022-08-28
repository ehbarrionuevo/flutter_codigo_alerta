import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';

SizedBox divider3 = const SizedBox(
  height: 3,
);
SizedBox divider6 = const SizedBox(
  height: 6,
);
SizedBox divider12 = const SizedBox(
  height: 12,
);
SizedBox divider20 = const SizedBox(
  height: 20,
);
SizedBox divider30 = const SizedBox(
  height: 30,
);
SizedBox divider40 = const SizedBox(
  height: 40,
);

SizedBox divider10Width = const SizedBox(
  width: 10,
);

Container circleWidget(double radius) => Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        shape: BoxShape.circle,
      ),
    );

Center loadingWidget() => Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: kFontPrimaryColor,
          strokeWidth: 1.7,
        ),
      ),
    );

Center emptyDataWidget() => Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/images/box.png',
        height: 70,
        color: kFontPrimaryColor.withOpacity(0.85),
      ),
      divider6,
      Text(
        "Aún no hay registros.",
        style: TextStyle(
          color: kFontPrimaryColor.withOpacity(0.85),
        ),
      ),
    ],
  ),
);


showSnackBarError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          divider10Width,
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    ),
  );
}


showSnackBarSuccess(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff06d6a0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          divider10Width,
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    ),
  );
}
