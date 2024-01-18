import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentItem extends StatelessWidget {
  final String path;
  final String title;
  const DocumentItem(
      {super.key, required this.path, this.title = "Lampiran Pengajuan"});

  @override
  Widget build(BuildContext context) {
    print(path);
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse("${AppConstants.BASE_URL}/$path");
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: lightRedColor, borderRadius: BorderRadius.circular(8)),
              width: 60,
              height: 60,
              child: Icon(
                Icons.picture_as_pdf,
                color: redColor,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
