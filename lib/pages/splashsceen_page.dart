import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';

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
      var token = await Get.find<AuthController>().getUserToken();
      print("token : $token");
      token.isEmpty
          ? Get.offNamed(RouteHelper.getSignIn())
          : Get.offNamed(RouteHelper.getHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Splash Screen")],
      ),
    );
  }
}
