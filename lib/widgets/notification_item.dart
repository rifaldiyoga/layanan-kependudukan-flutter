import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/widgets/badge_status.dart';

import '../theme.dart';

class NotificationItem extends StatelessWidget {
  final PengajuanModel pengajuanModel;
  const NotificationItem({super.key, required this.pengajuanModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, RouteHelper.getDetailPengajuan(pengajuanModel)),
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: backgroundColor2))),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BadgeStatus(status: pengajuanModel.status!),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Flexible(
                    child: Text(
                  "Pengajuan ${pengajuanModel.layanan}",
                  style:
                      primaryTextStyle.copyWith(fontWeight: bold, fontSize: 14),
                )),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Keperluan ${pengajuanModel.keterangan}",
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/image_profile.jpg",
                        height: 20,
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Pengaju :",
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      pengajuanModel.name ?? "",
                      style: blueTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  DateFormater.dateToTimeAgo(pengajuanModel.createdAt!),
                  textAlign: TextAlign.end,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
