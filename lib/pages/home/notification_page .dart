import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget itemNotif() {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, "/detail-pengajuan"),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: backgroundColor2))),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: secondaryColor,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        "Pending",
                        style: blueTextStyle.copyWith(fontSize: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Pengajuan Pengantar RT dan RW",
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Keterangan : Keperluan pengajuan surat pindah",
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
                        "Rifaldi Yoga",
                        style: blueTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "Kemarin",
                      textAlign: TextAlign.end,
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Notifikasi",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(100, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          for (int x = 0; x <= 10; x++) ...[itemNotif()]
        ]),
      ),
    );
  }
}
