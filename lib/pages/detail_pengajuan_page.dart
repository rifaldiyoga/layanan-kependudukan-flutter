import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

import '../widgets/button.dart';

class DetailPengajuanPage extends StatelessWidget {
  const DetailPengajuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: SecondaryButton(text: "Tolak", onPressed: () {})),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: PrimaryButton(
                    text: "Setujui",
                    onPressed: () {
                      Navigator.pushNamed(context, "/tanda-tangan");
                    })),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: secondaryColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Text(
                  "Pending",
                  style: blueTextStyle.copyWith(fontSize: 10),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Pengajuan Pengantar RT dan RW",
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
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
                  "Rifaldi Yoga",
                  style: blueTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Kemarin",
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              runSpacing: 8,
              children: [
                Text("Dengan ini menerangkan bahwa : "),
                Text("Nama : Rifaldi Yoga A"),
                Text("Tempat, Tgl Lahir : Sidorajo, 20 Mei 2003"),
                Text("Alamat : Jl. Pahlawan No RT 1 RW 2"),
                Text(
                    "Berniat untuk meminta surat pengantar untuk keperluan \"Pindah Domisili\"")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
