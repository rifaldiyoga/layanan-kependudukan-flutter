import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets//button.dart';

class TandaTanganPage extends StatelessWidget {
  const TandaTanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tanda Tangan",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(100, 255, 255, 255),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Gambar Tanda Tangan atau upload tanda tangan anda",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(16)),
              child: SizedBox(
                child: Align(
                    alignment: Alignment.center, child: Text("Tanda Tangan")),
              ),
            ),
            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: PrimaryButton(text: "Submit", onPressed: () {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
