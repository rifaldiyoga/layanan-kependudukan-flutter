import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class LayananItem extends StatelessWidget {
  final int index;
  final String title;
  final String code;
  final VoidCallback? callback;

  const LayananItem(
      {super.key,
      required this.index,
      required this.title,
      required this.code,
      this.callback});

  @override
  Widget build(BuildContext context) {
    Widget getIcon(String code, int index) {
      Color color = colorList[index % 4].color;
      switch (code) {
        case AppConstants.SKU:
          return Icon(
            Icons.sell,
            color: color,
          );
        case AppConstants.SKD:
          return Icon(
            Icons.apartment,
            color: color,
          );
        case AppConstants.SKBBK:
          return Icon(
            Icons.car_crash_outlined,
            color: color,
          );
        case AppConstants.SIK:
          return Icon(
            Icons.party_mode_rounded,
            color: color,
          );

        case AppConstants.SKKH:
          return Icon(
            Icons.bedroom_baby_outlined,
            color: color,
          );
        case AppConstants.SKPD:
          return Icon(
            Icons.login,
            color: color,
          );
        case AppConstants.SKPK:
          return Icon(
            Icons.logout,
            color: color,
          );
        case AppConstants.SKJD:
          return Icon(
            Icons.personal_injury,
            color: color,
          );
        case AppConstants.SKBPN:
          return Icon(
            Icons.person_pin_sharp,
            color: color,
          );
        case AppConstants.SKPN:
          return Icon(
            Icons.people,
            color: color,
          );
        case AppConstants.SPCK:
          return Icon(
            Icons.local_police,
            color: color,
          );
        case AppConstants.SKPOT:
          return Icon(
            Icons.money,
            color: color,
          );
        case AppConstants.SKTMR:
          return Icon(
            Icons.home_work_sharp,
            color: color,
          );
        case AppConstants.SSP:
          return Icon(
            Icons.add_home_work_sharp,
            color: color,
          );
        case AppConstants.SKKT:
          return Icon(
            Icons.landscape,
            color: color,
          );
        case AppConstants.SKTM:
          return Icon(
            Icons.money_off,
            color: color,
          );
        case AppConstants.SKTM:
          return Icon(
            Icons.money_off,
            color: color,
          );
        case AppConstants.SKKM:
          return Icon(
            Icons.add,
            color: color,
          );
        case "ALL":
          return Icon(
            Icons.border_all_outlined,
            color: color,
          );
        default:
          return Image.asset(
            "assets/icon_email.png",
            color: color,
          );
      }
    }

    return InkWell(
      onTap: () {
        if (callback != null) callback!();
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 90, minHeight: 150),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorList[index % 4].lightColor,
                  borderRadius: BorderRadius.circular(8)),
              width: 60,
              height: 60,
              child: getIcon(code, index),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: primaryTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
