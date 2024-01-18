import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      initializeDateFormatting("id");
      var token = await Get.find<AuthController>().getUserToken();
      print("token : $token");
      token.isEmpty
          ? Get.offNamed(RouteHelper.getSignIn())
          : Get.offNamed(RouteHelper.getHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "© 2023, Kelurahan Ngaglik",
              style: secondaryTextStyle,
            )
          ],
        ),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_kota_batu.png",
                    width: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const VerticalDivider(
                    color: Colors.blue,
                    width: 20, // Adjust the height of the Divider
                    thickness: 1, // Adjust the thickness of the Divider
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "LAYANAN\nKEPENDUDUKAN",
                    style: blueTextStyle.copyWith(
                        fontWeight: FontWeight.w900, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
