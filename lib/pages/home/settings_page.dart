import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/base/show_message.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/widgets/setting_item.dart';

import '../../theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget section() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Text(
            "Account Settings",
            style: secondaryTextStyle.copyWith(fontWeight: bold),
          ),
        ),
        Column(
          children: [
            SettingItem(
              title: "ProfileDetail",
              detail: "",
              callback: () {},
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    onLogout(AuthController authController) {
      authController.signOut().then((status) {
        if (status.isSuccess) {
          Get.find<AuthController>().clearSharedPref();
          Get.offAllNamed(RouteHelper.getSignIn());
        } else {
          showMessage(status.message);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Settings",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(100, 255, 255, 255),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingItem(
              title: "Logout",
              callback: () {
                onLogout(Get.find<AuthController>());
              },
            )
          ],
        ),
      ),
    );
  }
}
