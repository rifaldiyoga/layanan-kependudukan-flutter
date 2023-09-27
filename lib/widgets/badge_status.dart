import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

import '../theme.dart';

class BadgeStatus extends StatelessWidget {
  final String status;
  const BadgeStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Style style = Style(
        text: status, bgColor: secondaryColor, textStyle: primaryTextStyle);
    if (status == AppConstants.PENDING) {
      style = Style(
          text: "Pending",
          bgColor: lightYellowColor,
          textStyle: primaryTextStyle.copyWith(color: yellowColor));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: style.bgColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Text(
          style.text,
          style: style.textStyle.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}

class Style {
  String text;
  Color bgColor;
  TextStyle textStyle;

  Style({required this.text, required this.bgColor, required this.textStyle});
}
