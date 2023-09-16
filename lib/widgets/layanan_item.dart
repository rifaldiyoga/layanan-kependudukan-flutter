import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class LayananItem extends StatelessWidget {
  final int index;
  final String title;
  final String icon;
  final VoidCallback? callback;

  const LayananItem(
      {super.key,
      required this.index,
      required this.title,
      required this.icon,
      this.callback});

  @override
  Widget build(BuildContext context) {
    var ran = Random().nextInt(100);
    return InkWell(
      onTap: () {
        if (callback != null) callback!();
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 90, minHeight: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorList[index % 4].lightColor,
                  borderRadius: BorderRadius.circular(8)),
              width: 60,
              height: 60,
              child: Image.asset(
                icon,
                color: colorList[index % 4].color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
