import 'package:flutter/material.dart';

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
