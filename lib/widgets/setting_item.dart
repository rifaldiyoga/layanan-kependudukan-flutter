import 'package:flutter/material.dart';

import '../theme.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String? detail;
  final VoidCallback callback;
  const SettingItem(
      {super.key, required this.title, this.detail, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: backgroundColor2))),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(82, 141, 141, 141),
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.all(12),
              child: Image.asset(
                "assets/icon_arrow_back.png",
                width: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
                Visibility(
                    visible: detail != null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          detail ?? "",
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
