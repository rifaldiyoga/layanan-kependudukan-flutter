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
          text: "Menunggu RT",
          bgColor: lightYellowColor,
          textStyle: primaryTextStyle.copyWith(color: yellowColor));
    } else if (status == AppConstants.APPROVED_RT) {
      style = Style(
          text: "Menunggu RW",
          bgColor: secondaryColor,
          textStyle: primaryTextStyle.copyWith(color: primaryColor));
    } else if (status == AppConstants.APPROVED_RW ||
        status == AppConstants.PENDING_ADMIN) {
      style = Style(
          text: "Menunggu Kelurahan",
          bgColor: secondaryColor,
          textStyle: primaryTextStyle.copyWith(color: primaryColor));
    } else if (status == AppConstants.REJECTED_RT) {
      style = Style(
          text: "Ditolak RT",
          bgColor: lightRedColor,
          textStyle: primaryTextStyle.copyWith(color: redColor));
    } else if (status == AppConstants.REJECTED_RW) {
      style = Style(
          text: "Ditolak RW",
          bgColor: lightRedColor,
          textStyle: primaryTextStyle.copyWith(color: redColor));
    } else if (status == AppConstants.VALID) {
      style = Style(
          text: "Disetujui",
          bgColor: lightGreenColor,
          textStyle: primaryTextStyle.copyWith(color: greenColor));
    } else if (status == AppConstants.REJECTED) {
      style = Style(
          text: "Ditolak Kelurahan",
          bgColor: lightRedColor,
          textStyle: primaryTextStyle.copyWith(color: redColor));
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
